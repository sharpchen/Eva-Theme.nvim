---@type StaticImporter
local function indent_blankline(h)
    h:map('comment', 'IblIndent'):map('NONE', 'IblScope', function(_, _)
        return { fg = '#C97760' }
    end)
end

return indent_blankline
