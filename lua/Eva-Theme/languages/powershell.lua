---@type StaticImporter
local function powershell(h)
  h:map_token('func', '@function.builtin.powershell')
end

return powershell
