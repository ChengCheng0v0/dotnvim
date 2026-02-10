local M = {}

--- @param module_path string
function M.lazy_require(module_path)
  return setmetatable({}, {
    __index = function(t, key)
      local m = require(module_path)
      for k, v in pairs(m) do
        t[k] = v
      end
      return m[key]
    end,
  })
end

--- @param module_path string
--- @return boolean
function M.has_module(module_path)
  local ok, _ = pcall(require, module_path)
  return ok
end

return M
