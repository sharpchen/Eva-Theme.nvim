---@type Eva-Theme.StaticImporter
local function csharp(h)
  h:map_token('property', { '@module.c_sharp', '@lsp.type.namespace.cs', '@lsp.type.xmlDocCommentName.cs', 'csXmlTag' })
    :map_token('logical', { '@keyword.conditional.c_sharp', '@constant.builtin.c_sharp' })
    :map_token('variable', '@lsp.type.enum.cs')
    :map_token('type', { '@lsp.type.xmlDocCommentAttributeName.cs', 'csXmlAttrib', 'csNewType' })
    :map_token('NONE', '@lsp.type.keyword.cs')
end

return csharp
