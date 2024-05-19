---@type StaticImporter
local function csharp(h)
    h:map('property', { '@module.c_sharp', '@lsp.type.namespace.cs' })
        :map('logical', { '@keyword.conditional.c_sharp', '@constant.builtin.c_sharp' })
        :map('variable', '@lsp.type.enum.cs')
end

return csharp
