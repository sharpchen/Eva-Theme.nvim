---@type StaticImporter
local function indent_blankline(h)
    h:match('comment', 'IblIndent'):match('digit', 'IblScope')
end

return indent_blankline
