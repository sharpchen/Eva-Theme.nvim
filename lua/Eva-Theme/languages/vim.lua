---@param s Eva-Theme.HighlightSource
local function vim(s)
  s:map_token('property', '@variable.builtin.vim')
end

return vim
