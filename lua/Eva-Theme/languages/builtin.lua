---@type StaticImporter
local function builtin(h)
    h
        :match('type', 'Type')
        :match('func', 'Function')
        :match('text',
            { 'String', 'Character', 'SpecialComment', 'Todo', })
        :match('digit',
            { 'Constant', 'Number', 'Float', 'Special', 'SpecialChar', })
        :match('logical', { 'Boolean', 'Conditional', 'Repeat', 'Label', 'Exception', 'PreCondit' })
        :match('operator', 'Operator')
        :match('declarative',
            { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'StorageClass', 'Structure', 'Typedef' })
        :match('variable', 'Identifier')
        :match('instanceReference',
            {})
        :match('comment', 'Comment')
end

return builtin
