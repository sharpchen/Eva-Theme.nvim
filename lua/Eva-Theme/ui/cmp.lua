---@type StaticImporter
local function cmp(h)
  h:map_ui(
    'info',
    { 'CmpItemAbbrMatch', 'CmpItemKindMatchFuzzy', 'CmpItemKindMatch', 'CmpItemKindFile' },
    function(p, as)
      return { fg = p[as], bold = true }
    end
  )
    :map_ui('variable', { 'CmpItemKindVariable', 'CmpItemKindFolder' })
    :map_ui('func', {
      'CmpItemKindFunction',
      'CmpItemKindMethod',
      'CmpItemKindConstructor',
      'CmpItemKindOperator',
      'CmpItemKindConstructorDefault',
      'CmpItemAbbrMatchFuzzyDefault',
    })
    :map_ui('property', { 'CmpItemKindProperty', 'CmpItemKindField', 'CmpItemKindModule', 'CmpItemKindFieldDefault' })
    :map_ui('digit', {
      'CmpItemKindUnit',
      'CmpItemKindEnum',
      'CmpItemKindColor',
      'CmpItemKindEnumMember',
      'CmpItemKindConstant',
      'CmpItemKindValue',
    })
    :map_ui('text', { 'CmpItemKindText', 'CmpItemKindReference', 'CmpItemKindTextDefault' })
    :map_ui('type', {
      'CmpItemKindClass',
      'CmpItemKindInterface',
      'CmpItemKindStruct',
      'CmpItemKindTypeParameter',
      'CmpItemKindStructDefault',
    })
    :map_ui('declarative', { 'CmpItemKindKeyword', 'CmpItemKindSnippet', 'CmpItemKindKeywordDefault' })
    :map_ui('logical', 'CmpItemKindEvent')
    :map_ui('comment', { 'CmpItemMenuDefault' })
end

return cmp
