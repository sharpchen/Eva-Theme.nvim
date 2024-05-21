---@type StaticImporter
local function indent_blankline(h)
    h:map('comment', 'IblIndent'):map('NONE', 'IblScope', function(_, _) -- indent line match
        return { fg = '#C97760' }
    end)
        :map('variable', 'IblWhitespace')
end

return indent_blankline
