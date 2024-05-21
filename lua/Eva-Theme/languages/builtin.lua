require('Eva-Theme.utils')
---@type StaticImporter
local function builtin(h)
    h
        :map('type', { 'Type', 'StorageClass', 'Structure' })
        :map('func', 'Function')
        :map('text',
            { 'String', 'Character', 'SpecialComment', 'Todo', })
        :map('digit',
            { 'Constant', 'Number', 'Float', 'SpecialChar', 'Format' })
        :map('logical', { 'Boolean', 'Conditional', 'Repeat', 'Label', 'Exception', 'PreCondit' })
        :map('operator', 'Operator')
        :map('declarative',
            { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'Typedef' })
        :map('variable', { 'Identifier', 'Statement' })
        :map('instanceReference',
            {})
        :map('comment', 'Comment')
        :map('NONE', 'Special', function(palette, _) -- escaped characters
            return { fg = IsDark(palette) and '#8A97C3' or '#888888' }
        end)
end

return builtin
