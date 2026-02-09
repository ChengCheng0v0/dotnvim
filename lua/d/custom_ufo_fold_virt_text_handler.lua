local M = {}

local function handler(virt_text, lnum, end_lnum, width, truncate)
  local new_virt_text = {}

  local fold_count = end_lnum - lnum
  local suffix = string.format('  󰁂 %d ', fold_count)

  local suffix_width = vim.fn.strdisplaywidth(suffix)
  local target_width = width - suffix_width
  local current_width = 0

  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local hl_group = chunk[2]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)

    if current_width + chunk_width < target_width then
      table.insert(new_virt_text, { chunk_text, hl_group })
      current_width = current_width + chunk_width
    else
      local remaining_space = target_width - current_width
      local truncated_text = truncate(chunk_text, remaining_space)
      local truncated_width = vim.fn.strdisplaywidth(truncated_text)

      table.insert(new_virt_text, { truncated_text, hl_group })

      if current_width + truncated_width < target_width then
        local padding_count = target_width - (current_width + truncated_width)
        suffix = suffix .. string.rep(' ', padding_count)
      end

      break
    end
  end

  table.insert(new_virt_text, { suffix, 'MoreMsg' })

  return new_virt_text
end

return handler
