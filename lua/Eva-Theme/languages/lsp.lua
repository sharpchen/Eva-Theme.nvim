---@param s Eva-Theme.HighlightSource
local function lsp(s)
  s:map_token('parameter', { '@lsp.type.parameter' })
    :map_token('property', '@lsp.type.property')
    :map_token('typeparam', '@lsp.type.typeParameter')
  -- :map('digit', { '@lsp.typemod.variable.readonly' })
end

return lsp
