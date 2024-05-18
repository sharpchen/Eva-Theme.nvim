---@type StaticImporter
local function indent_blankline(h)
    h:map('comment', 'IblIndent'):map('digit', 'IblScope')
end

return indent_blankline
