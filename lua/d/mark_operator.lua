local module_name = 'Mark Operator'

local function delete(marks, target)
  if target:byte() == 27 then
    vim.notify('Cancelled', vim.log.levels.INFO, { title = module_name .. ' (Delete)' })
  elseif target == ' ' then
    marks.delete_buf()
  elseif target == '-' then
    marks.delete_line()
  elseif target == '=' then
    marks.delete_bookmark()
  elseif target:match('%d') then
    local func_name = 'delete_bookmark' .. target
    if marks[func_name] then
      marks[func_name]()
    end
  else
    marks.mark_state:delete_mark(target)
  end
end

local function operator()
  local marks = require('marks')

  local op = vim.v.operator
  local target = vim.fn.nr2char(vim.fn.getchar()) --- @diagnostic disable-line: param-type-mismatch

  if op == 'd' then
    delete(marks, target)
  else
    vim.notify(string.format('Unsupported operation (%s)', op), vim.log.levels.ERROR, { title = module_name })
  end
end

return operator
