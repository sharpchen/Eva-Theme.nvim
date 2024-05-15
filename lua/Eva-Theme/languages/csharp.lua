---@type Importor
local function csharp(h)
    --#region treesitter
    h:match('type', { '@attribute', '@constructor' })
        :match('func', { '@function.method', '@function.method.call' })
    -- :match('text', {},
    -- function(palette, as) return { fg = palette[as], bold = IsBold(palette) } end)
        :match('digit', { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float' })
        :match('logical', { '@boolean' })
        :match('operator', { '@operator' })
        :match('property', { '@label', '@variable.member', '@property' })
        :match('variable', { '@variable' })
        :match('parameter', { '@variable.parameter', '@variable.parameter.builtin' })
        :match('primitive', { '@type.builtin' })
        :match('declarative', { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.function' })
        :match('instanceReference', { '@variable.builtin', '@module.builtin' })
    --#endregion
    --#region builtin highlight groups
        :match('type', { 'Type', 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
        :match('func', { 'Function' })
        :match('text',
            { 'String', 'Character', 'SpecialComment', 'Todo', 'DiagnosticInfo', 'DiagnosticVirtualTextInfo',
                'DiagnosticFloatingInfo', 'DiagnosticSignInfo' })
        :match('digit',
            { 'Constant', 'Number', 'Float', 'Special', 'SpecialChar', 'DiagnosticWarn', 'DiagnosticVirtualTextWarn',
                'DiagnosticFloatingWarn', 'DiagnosticSignWarn' })
        :match('logical', { 'Boolean', 'Conditional', 'Repeat', 'Label', 'Exception', 'PreCondit' })
        :match('operator', { 'Operator' })
        :match('declarative',
            { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'StorageClass', 'Structure', 'Typedef' })
        :match('variable',
            { 'Identifier', 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' })
        :match('instanceReference',
            { 'Error', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError', 'DiagnosticSignError' })

    --#endregion
end

return csharp
