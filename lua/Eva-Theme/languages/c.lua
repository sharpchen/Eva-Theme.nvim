---@type StaticImporter
local function c(h)
    h:map_token('logical', { '@keyword.return.c', '@keyword.conditional.c', '@keyword.repeat.c' })
end

return c
