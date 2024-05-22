require('Eva-Theme.utils')
---@type StaticImporter
local function indent_blankline(h)
    h:map('comment', 'IblIndent'):map('NONE', 'IblScope', function(_, _) -- indent line match
        return { fg = '#C97760' }
    end)
        :map('NONE', 'IblWhitespace', function(palette, _)
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
        end)
end

return indent_blankline
