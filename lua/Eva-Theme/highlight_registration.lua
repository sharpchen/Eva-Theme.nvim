---@type Selector
local function default_selector(palette, as)
    return { fg = palette[as] }
end
local function create_highlights()
    ---@type HighlightRegistrationWithFunction
    local instance = {}
    ---Add highlight group to syntax type
    ---@type Match
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
    function instance:highlight_groups(palette)
        ---@type table<string, TokenStyle>
        local highlight_group = {}
        for syntax_type, scope_list in pairs(self) do
            -- instance functions are part of the table, so skip it
            if (type(scope_list) == 'function') then goto next end
            for _, item in ipairs(scope_list) do
                local selector = item.selector or default_selector
                highlight_group[item.scope] = selector(palette, syntax_type)
            end
            ::next::
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
    :with(require('Eva-Theme.languages.csharp'))
    :with(require('Eva-Theme.languages.lua'))
    :with(require('Eva-Theme.ui.builtin'))
    :with(require('Eva-Theme.ui.indent-blankline'))
