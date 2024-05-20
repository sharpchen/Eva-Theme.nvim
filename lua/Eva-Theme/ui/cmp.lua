---@type StaticImporter
local function cmp(h)
    h:map('info', { 'CmpItemAbbrMatch', 'CmpItemKindMatchFuzzy', 'CmpItemKindMatch', 'CmpItemKindFile' })
        :map('variable', { 'CmpItemKindVariable', 'CmpItemKindFolder' })
        :map('func', { 'CmpItemKindFunction', 'CmpItemKindMethod', 'CmpItemKindConstructor', 'CmpItemKindOperator' })
        :map('property', { 'CmpItemKindProperty', 'CmpItemKindField', 'CmpItemKindModule' })
        :map('digit',
            { 'CmpItemKindUnit', 'CmpItemKindEnum', 'CmpItemKindColor', 'CmpItemKindEnumMember', 'CmpItemKindConstant',
                'CmpItemKindValue' })
        :map('text', { 'CmpItemKindText', 'CmpItemKindReference' })
        :map('type', { 'CmpItemKindClass', 'CmpItemKindInterface', 'CmpItemKindStruct', 'CmpItemKindTypeParameter' })
        :map('declarative', { 'CmpItemKindKeyword', 'CmpItemKindSnippet' })
        :map('logical', 'CmpItemKindEvent')
end

return cmp
