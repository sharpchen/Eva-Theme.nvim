---@type StaticImporter
local function editorconfig(h)
  h:map_token('property', 'editorconfigProperty')
end

return editorconfig
