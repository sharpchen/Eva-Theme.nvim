local function create_highlights()
    ---@type HighlightRegistrationWithFunction
    local instance = {
        syntax = {},
        ---@type { color: string, group: string | string[], func: fun(color: string): TokenStyle }[]
        color = {}
    }
    ---Add highlight group to syntax type
    ---@type Match
    function instance:match(syntax, group, selector)
        if (not self.syntax[syntax]) then
            self.syntax[syntax] = {}
        end
        if (type(group) == 'string') then
            table.insert(self.syntax[syntax], { group = group, selector = selector })
        else
            for _, g in ipairs(group) do
                table.insert(self.syntax[syntax], { group = g, selector = selector })
            end
        end
        return self
    end

    ---comment
    ---@param color string
    ---@param group string | string[]
    ---@param proc function
    function instance:match_color(color, group, proc)
        if type(group) == 'string' then
            table.insert(self.color, { color = color, group = group, func = proc })
        else
            for _, g in ipairs(group) do
                table.insert(self.color, { color = color, func = proc })
            end
        end
        return self
    end

    ---create highlight group by palette
    ---@param palette Palette theme variant
    function instance:highlight_groups(palette)
        ---@type table<string, TokenStyle>
        local highlight_group = {}
        for syntax_type, group_list in pairs(self.syntax) do
            for _, item in ipairs(group_list) do
                local selector = item.selector or require('Eva-Theme.selector_handler'):handle(palette, item.group)
                highlight_group[item.group] = selector(palette, syntax_type)
            end
        end
        for _, item in ipairs(self.color) do
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
    :with(require('Eva-Theme.languages.csharp'))
    :with(require('Eva-Theme.languages.lua'))
    :with(require('Eva-Theme.ui.builtin'))
    :with(require('Eva-Theme.ui.indent-blankline'))
