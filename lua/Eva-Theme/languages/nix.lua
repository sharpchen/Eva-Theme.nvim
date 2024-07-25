---@type StaticImporter
local function nix(h)
  h:map_token('digit', { 'nixBuiltin', '@lsp.typemod.struct.builtin.nix' })
    :map_token('func', '@function.builtin.nix')
    :map_token('property', '@lsp.typemod.constant.readonly.nix')
end

return nix
