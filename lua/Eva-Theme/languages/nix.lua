---@param s Eva-Theme.HighlightSource
local function nix(s)
  s:map_token('digit', { 'nixBuiltin', '@lsp.typemod.struct.builtin.nix' })
    :map_token('func', '@function.builtin.nix')
    :map_token('property', '@lsp.typemod.constant.readonly.nix')
end

return nix
