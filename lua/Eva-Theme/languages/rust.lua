---@type StaticImporter
local function rust(h)
    h:map_token('logical', '@lsp.typemod.keyword.controlFlow.rust')
        :map_token('primitive', '@lsp.type.builtinType.rust')
        :map_token('type', '@lsp.type.typeAlias.rust')
end

return rust
