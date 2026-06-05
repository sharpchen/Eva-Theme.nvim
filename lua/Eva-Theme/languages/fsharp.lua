---@param s Eva-Theme.HighlightSource
local function fsharp(s)
  s:map_token('type', '@module.builtin.fsharp'):map_token('parameter', '@variable_parameter.fsharp')
end

return fsharp
