local M = {}

local root = require('utils.root')

local OIL_TAB_KEY = '__oil_tab'
local OIL_PREV_TAB_KEY = '__oil_prev_tab'
local OIL_PREV_WIN_KEY = '__oil_prev_win'
local SETUP_DONE_KEY = '__dotnvim_oil_setup'

local PREVIEW_MAX_BYTES = 1024 * 1024

local function oil()
  return require('oil')
end

local function actions()
  return require('oil.actions')
end

local function get_tab_var(tab, key)
  local ok, value = pcall(vim.api.nvim_tabpage_get_var, tab, key)
  return ok and value or nil
end

local function is_blank_scratch(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return false
  end
  if vim.api.nvim_buf_get_name(buf) ~= '' then
    return false
  end
  if vim.bo[buf].buftype ~= '' then
    return false
  end
  if vim.bo[buf].modified then
    return false
  end
  return true
end

local function tab_has_oil_window(tab)
  if not vim.api.nvim_tabpage_is_valid(tab) then
    return false
  end

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'oil' then
      return true
    end
  end

  return false
end

local function close_tab(tab)
  if not vim.api.nvim_tabpage_is_valid(tab) then
    return
  end

  local tabnr = vim.api.nvim_tabpage_get_number(tab)
  vim.cmd(string.format('%dtabclose', tabnr))
end

local function delete_if_unused_blank_scratch(buf)
  if not is_blank_scratch(buf) then
    return
  end
  if #vim.fn.win_findbuf(buf) > 0 then
    return
  end

  pcall(vim.api.nvim_buf_delete, buf, { force = true })
end

local function resolve_origin()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local current_win = vim.api.nvim_get_current_win()

  if not vim.t[OIL_TAB_KEY] then
    return current_tab, current_win
  end

  local origin_tab = vim.t[OIL_PREV_TAB_KEY]
  if not (origin_tab and vim.api.nvim_tabpage_is_valid(origin_tab) and origin_tab ~= current_tab) then
    return current_tab, current_win
  end

  local origin_win = vim.t[OIL_PREV_WIN_KEY]
  if
    origin_win
    and vim.api.nvim_win_is_valid(origin_win)
    and vim.api.nvim_win_get_tabpage(origin_win) == origin_tab
  then
    return origin_tab, origin_win
  end

  return origin_tab, nil
end

local function resolve_target_tab(current_tab, preferred_tab)
  if preferred_tab and vim.api.nvim_tabpage_is_valid(preferred_tab) and preferred_tab ~= current_tab then
    return preferred_tab
  end

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    if tab ~= current_tab then
      return tab
    end
  end

  return nil
end

local function join_path(dir, name)
  if dir:sub(-1) == '/' then
    return dir .. name
  end
  return dir .. '/' .. name
end

local function is_stray_oil_tab(tab)
  if not vim.api.nvim_tabpage_is_valid(tab) then
    return false
  end
  if get_tab_var(tab, OIL_TAB_KEY) ~= true then
    return false
  end
  if tab_has_oil_window(tab) then
    return false
  end

  local wins = vim.api.nvim_tabpage_list_wins(tab)
  if #wins ~= 1 then
    return false
  end

  local buf = vim.api.nvim_win_get_buf(wins[1])
  return is_blank_scratch(buf)
end

local function cleanup_stray_oil_tabs()
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    if is_stray_oil_tab(tab) then
      vim.schedule(function()
        if is_stray_oil_tab(tab) then
          pcall(close_tab, tab)
        end
      end)
    end
  end
end

local function open_tab(dir)
  M.setup()

  local origin_tab, origin_win = resolve_origin()

  vim.cmd.tabnew()
  local tabnew_buf = vim.api.nvim_get_current_buf()
  vim.t[OIL_TAB_KEY] = true
  vim.t[OIL_PREV_TAB_KEY] = origin_tab
  vim.t[OIL_PREV_WIN_KEY] = origin_win

  oil().open(dir, nil, function()
    delete_if_unused_blank_scratch(tabnew_buf)
    cleanup_stray_oil_tabs()
  end)
end

function M.open_root_tab()
  open_tab(root())
end

function M.open_cwd_tab()
  open_tab(vim.uv.cwd())
end

function M.select()
  local entry = oil().get_cursor_entry()
  if not (vim.t[OIL_TAB_KEY] and entry and entry.type ~= 'directory') then
    actions().select.callback()
    return
  end

  local oil_tab = vim.api.nvim_get_current_tabpage()
  local target_tab = resolve_target_tab(oil_tab, vim.t[OIL_PREV_TAB_KEY])
  local dir = oil().get_current_dir()
  if not (target_tab and dir) then
    actions().select.callback()
    return
  end

  local target_win = vim.t[OIL_PREV_WIN_KEY]
  local path = join_path(dir, entry.name)

  vim.api.nvim_set_current_tabpage(target_tab)
  if
    target_win
    and vim.api.nvim_win_is_valid(target_win)
    and vim.api.nvim_win_get_tabpage(target_win) == target_tab
  then
    vim.api.nvim_set_current_win(target_win)
  end

  vim.cmd.edit(vim.fn.fnameescape(path))
  close_tab(oil_tab)
end

function M.close()
  if not vim.t[OIL_TAB_KEY] then
    actions().close.callback()
    return
  end

  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins > 1 then
    vim.cmd.close()
  else
    vim.cmd.tabclose()
  end
end

function M.setup()
  if vim.g[SETUP_DONE_KEY] then
    return
  end
  vim.g[SETUP_DONE_KEY] = true

  local group = vim.api.nvim_create_augroup('DotNvimOilTab', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'WinEnter', 'WinClosed', 'TabEnter' }, {
    group = group,
    callback = cleanup_stray_oil_tabs,
  })

  vim.schedule(cleanup_stray_oil_tabs)
end

function M.disable_preview(filename)
  return vim.fn.getfsize(filename) > PREVIEW_MAX_BYTES
end

function M.is_always_hidden(name, _)
  return name == '.DS_Store'
end

return M
