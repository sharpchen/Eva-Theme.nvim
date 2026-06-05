---@param s Eva-Theme.HighlightSource
local function editorconfig(s)
  s:map_token('property', 'editorconfigProperty')
end

return editorconfig
