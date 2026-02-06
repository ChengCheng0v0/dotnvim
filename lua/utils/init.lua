local M = {}

M.core = require('utils.core')

for k, v in pairs(M.core) do
  M[k] = v
end

return M
