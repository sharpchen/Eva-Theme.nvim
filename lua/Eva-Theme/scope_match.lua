---@type fun(palette: Palette, as: SyntaxType): TokenStyle
local function default_selector(palette, as)
    return { fg = palette[as] }
end
local function make_scope()
    ---@type table<SyntaxType, { scope: string, selector?: fun(palette: Palette, as: SyntaxType): TokenStyle }[]>
    local instance = {}
    ---Add highlight group to syntax type
    ---@param syntax SyntaxType syntax type
    ---@param scope string | string[] highlight scope
    ---@param selector? fun(palette: Palette, as: SyntaxType): TokenStyle
    ---@return self
    function instance:match(syntax, scope, selector)
        if (not self[syntax]) then
            self[syntax] = {}
        end
        if (type(scope) == 'string') then
            table.insert(self[syntax], { scope = scope, selector = selector })
        else
            for _, scp in ipairs(scope) do
                table.insert(self[syntax], { scope = scp, selector = selector })
            end
        end
        return self
    end

    ---create highlight group by palette
    ---@param palette Palette theme variant
    function instance:create_highlight_groups(palette)
        ---@type table<string, TokenStyle>
        local highlight_group = {}
        for syntax_type, scope_list in pairs(self) do
            for _, item in ipairs(scope_list) do
                local selector = item.selector or default_selector
                highlight_group[item.scope] = selector(palette, syntax_type)
            end
        end
        return highlight_group
    end

    return instance
end


return make_scope()
    --#region treesitter
    :match('type', { '@attribute', '@constructor' })
    :match('func', { '@function.method', '@function.method.call' })
    :match('text', {},
        function(palette, as) return { fg = palette[as], bold = IsBold(palette) } end)
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
    :match('declarative', { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'StorageClass', 'Structure', 'Typedef' })
    :match('variable',
        { 'Identifier', 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' })
    :match('instanceReference',
        { 'Error', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError', 'DiagnosticSignError' })


--#endregion
