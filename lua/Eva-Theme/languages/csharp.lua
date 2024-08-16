---@type StaticImporter
local function csharp(h)
  h:map_token('property', { '@module.c_sharp', '@lsp.type.namespace.cs' })
    :map_token('logical', { '@keyword.conditional.c_sharp', '@constant.builtin.c_sharp' })
    :map_token('variable', '@lsp.type.enum.cs')
end

return csharp
