local function create_highlights()
    ---@type HighlightRegistrationWithFunction
    local instance = {
        syntax = {},
        ui = {},
    }
    ---Add highlight group to syntax type
    ---@type MapProc
    function instance:map_token(syntax, group, selector)
        if (not self.syntax[syntax]) then
            self.syntax[syntax] = {}
        end
        if type(group) == 'string' then
            table.insert(self.syntax[syntax], { group = group, selector = selector })
        else
            for _, g in ipairs(group) do
                table.insert(self.syntax[syntax], { group = g, selector = selector })
            end
        end
        return self
    end

    ---@type MapProc
    function instance:map_ui(group_type, group, selector)
        if (not self.ui[group_type]) then
            self.ui[group_type] = {}
        end
        if type(group) == 'string' then
            table.insert(self.ui[group_type], { group = group, selector = selector })
        else
            for _, g in ipairs(group) do
                table.insert(self.ui[group_type], { group = g, selector = selector })
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
        for group_type, group_list in pairs(self.ui) do
            for _, item in ipairs(group_list) do
                local selector = item.selector or function(palette, as)
                    return { fg = palette[as] }
                end
                highlight_group[item.group] = selector(palette, group_type)
            end
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
    :with(require('Eva-Theme.languages.html'))
    :with(require('Eva-Theme.languages.vue'))
    :with(require('Eva-Theme.ui.builtin'))
    :with(require('Eva-Theme.ui.indent-blankline'))
    :with(require('Eva-Theme.ui.bufferline'))
    :with(require('Eva-Theme.ui.cmp'))
    :with(require('Eva-Theme.ui.gitsigns'))
    :with(require('Eva-Theme.ui.neo-tree'))
    :with(require('Eva-Theme.ui.vim-illuminate'))
