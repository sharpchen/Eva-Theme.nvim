local function create_highlights()
    ---@type HighlightRegistrationWithFunction
    local instance = {
        syntaxes = {},
        ---@type { color: string, group: string | string[], func: fun(color: string): TokenStyle }[]
        dark = {},
        ---@type { color: string, group: string | string[], func: fun(color: string): TokenStyle }[]
        light = {}
    }
    ---Add highlight group to syntax type
    ---@type MapSyntax
    function instance:map(syntax, group, selector)
        if (not self.syntaxes[syntax]) then
            self.syntaxes[syntax] = {}
        end
        if type(group) == 'string' then
            table.insert(self.syntaxes[syntax], { group = group, selector = selector })
        else
            for _, g in ipairs(group) do
                table.insert(self.syntaxes[syntax], { group = g, selector = selector })
            end
        end
        return self
    end

    ---@param color string
    ---@param group string | string[]
    ---@param func? fun(color: string, dark: boolean): TokenStyle
    function instance:map_dark(color, group, func)
        if type(group) == 'string' then
            table.insert(self.dark, { color = color, group = group, func = func })
        else
            for _, g in ipairs(group) do
                table.insert(self.dark, { color = color, group = g, func = func })
            end
        end
        return self
    end

    ---@param color string
    ---@param group string | string[]
    ---@param func? fun(color: string, dark: boolean): TokenStyle
    function instance:map_light(color, group, func)
        if type(group) == 'string' then
            table.insert(self.light, { color = color, group = group, func = func })
        else
            for _, g in ipairs(group) do
                table.insert(self.light, { color = color, group = g, func = func })
            end
        end
        return self
    end

    ---create highlight group by palette
    ---@param palette Palette theme variant
    function instance:highlight_groups(palette)
        ---@type table<string, TokenStyle>
        local highlight_group = {}
        for syntax_type, group_list in pairs(self.syntaxes) do
            for _, item in ipairs(group_list) do
                local selector = item.selector or require('Eva-Theme.selector_handler'):handle(palette, item.group)
                highlight_group[item.group] = selector(palette, syntax_type)
            end
        end
        for _, item in ipairs(IsDark(palette) and self.dark or self.light) do
            local func = item.func or function(color)
                return { bg = color }
            end
            highlight_group[item.group] = func(item.color)
        end
        return highlight_group
    end

    ---@type Import
    function instance:with(procedure)
        procedure(self)
        return self
    end

    return instance
end


return create_highlights()
    :with(require('Eva-Theme.languages.builtin'))
    :with(require('Eva-Theme.languages.treesitter'))
    :with(require('Eva-Theme.languages.lsp'))
    :with(require('Eva-Theme.languages.c'))
    :with(require('Eva-Theme.languages.csharp'))
    :with(require('Eva-Theme.languages.lua'))
    :with(require('Eva-Theme.languages.javascript'))
    :with(require('Eva-Theme.languages.markdown'))
    :with(require('Eva-Theme.ui.builtin'))
    :with(require('Eva-Theme.ui.indent-blankline'))
    :with(require('Eva-Theme.ui.bufferline'))
    :with(require('Eva-Theme.ui.cmp'))
    :with(require('Eva-Theme.ui.gitsigns'))
    :with(require('Eva-Theme.ui.neo-tree'))
