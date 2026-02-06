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

return M
