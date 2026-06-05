---@param s Eva-Theme.HighlightSource
local function c(s)
  s:map_token('logical', { '@keyword.return.c', '@keyword.conditional.c', '@keyword.repeat.c' })
end

return c
