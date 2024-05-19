---@type StaticImporter
local function c(h)
    h:map('logical', { '@keyword.return.c', '@keyword.conditional.c', '@keyword.repeat.c' })
end

return c
