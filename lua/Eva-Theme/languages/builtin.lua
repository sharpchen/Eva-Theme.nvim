---@type StaticImporter
local function builtin(h)
    h
        :map('type', { 'Type', 'StorageClass', 'Structure' })
        :map('func', 'Function')
        :map('text',
            { 'String', 'Character', 'SpecialComment', 'Todo', })
        :map('digit',
            { 'Constant', 'Number', 'Float', 'SpecialChar', })
        :map('logical', { 'Boolean', 'Conditional', 'Repeat', 'Label', 'Exception', 'PreCondit' })
        :map('operator', 'Operator')
        :map('declarative',
            { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'Typedef' })
        :map('variable', { 'Identifier', 'Statement', 'Special' })
        :map('instanceReference',
            {})
        :map('comment', 'Comment')
end

return builtin
