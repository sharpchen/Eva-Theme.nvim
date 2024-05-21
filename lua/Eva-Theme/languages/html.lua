require('Eva-Theme.utils')
---@type StaticImporter
local function html(h)
    h:map('text', '@string.special.url.html'):map('NONE', '@tag.delimiter.html', function(palette, _)
        return { fg = IsDark(palette) and '#838FA7' or '#727376' }
    end)
end

return html
