---@type StaticImporter
local function typescript(h)
  h:map_token(
    'logical',
    { '@keyword.return.typescript', '@keyword.conditional.typescript', '@constant.builtin.typescript' }
  )
    :map_token('property', { '@lsp.type.namespace.typescript', '@variable.member.typescript' })
    :map_token('func', '@constructor.typescript')
    :map_token('func', '@punctuation.special.typescript', function(p, as)
      return { fg = p[as], nocombine = true }
    end)
    :map_token('digit', '@lsp.typemod.variable.defaultLibrary.typescript')
end

return typescript
