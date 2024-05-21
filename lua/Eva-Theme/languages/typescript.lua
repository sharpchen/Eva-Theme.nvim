---@type StaticImporter
local function typescript(h)
    h:map('logical', { '@keyword.return.typescript', '@keyword.conditional.typescript', '@constant.builtin.typescript' })
        :map('property', '@lsp.type.namespace.typescript')
        :map('func', '@constructor.typescript')
end

return typescript
