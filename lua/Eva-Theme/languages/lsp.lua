---@type Eva-Theme.StaticImporter
local function lsp(h)
  h:map_token('parameter', { '@lsp.type.parameter' })
    :map_token('property', '@lsp.type.property')
    :map_token('typeparam', '@lsp.type.typeParameter')
  -- :map('digit', { '@lsp.typemod.variable.readonly' })
end

return lsp
