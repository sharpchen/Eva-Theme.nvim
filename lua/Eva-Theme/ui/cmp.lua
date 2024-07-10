---@type StaticImporter
local function cmp(h)
  h:map_ui('info', { 'CmpItemAbbrMatch', 'CmpItemKindMatchFuzzy', 'CmpItemKindMatch', 'CmpItemKindFile' })
    :map_ui('variable', { 'CmpItemKindVariable', 'CmpItemKindFolder' })
    :map_ui('func', { 'CmpItemKindFunction', 'CmpItemKindMethod', 'CmpItemKindConstructor', 'CmpItemKindOperator' })
    :map_ui('property', { 'CmpItemKindProperty', 'CmpItemKindField', 'CmpItemKindModule' })
    :map_ui('digit', {
      'CmpItemKindUnit',
      'CmpItemKindEnum',
      'CmpItemKindColor',
      'CmpItemKindEnumMember',
      'CmpItemKindConstant',
      'CmpItemKindValue',
    })
    :map_ui('text', { 'CmpItemKindText', 'CmpItemKindReference' })
    :map_ui('type', { 'CmpItemKindClass', 'CmpItemKindInterface', 'CmpItemKindStruct', 'CmpItemKindTypeParameter' })
    :map_ui('declarative', { 'CmpItemKindKeyword', 'CmpItemKindSnippet' })
    :map_ui('logical', 'CmpItemKindEvent')
end

return cmp
