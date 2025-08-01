---@type Eva-Theme.StaticImporter
local function typescript(h)
  h:map_token('logical', {
    '@keyword.return.typescript',
    '@keyword.conditional.typescript',
    '@constant.builtin.typescript',
    'typescriptImport',
  })
    :map_token(
      'property',
      {
        '@lsp.type.namespace.typescript',
        '@variable.member.typescript',
        'typescriptObjectLabel',
        'typescriptMember',
        'typescriptArrayMethod',
      }
    )
    :map_token('func', { '@constructor.typescript', 'typescriptObjectStaticMethod' })
    :map_token('func', '@punctuation.special.typescript', function(p, as)
      return { fg = p[as], nocombine = true }
    end)
    :map_token('digit', '@lsp.typemod.variable.defaultLibrary.typescript')
    :map_token('declarative', { 'typescriptImportType', 'typescriptVariable' })
    :map_token('parameter', { 'typescriptFuncCallArg' })
end

return typescript
