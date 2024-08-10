---@type StaticImporter
local function fsharp(h)
  h:map_token('type', '@module.builtin.fsharp')
end

return fsharp
