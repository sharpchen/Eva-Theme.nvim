---@type Eva-Theme.StaticImporter
local function fsharp(h)
  h:map_token('type', '@module.builtin.fsharp'):map_token('parameter', '@variable_parameter.fsharp')
end

return fsharp
