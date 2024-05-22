---@type StaticImporter
local function typescript(h)
    h:map_token('logical',
        { '@keyword.return.typescript', '@keyword.conditional.typescript', '@constant.builtin.typescript' })
        :map_token('property', '@lsp.type.namespace.typescript')
        :map_token('func', '@constructor.typescript')
end

return typescript
