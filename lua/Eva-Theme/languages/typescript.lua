---@type StaticImporter
local function typescript(h)
    h:map('logical', { '@keyword.return.typescript', '@keyword.conditional.typescript' })
end

return typescript
