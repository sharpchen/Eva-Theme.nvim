require('Eva-Theme.utils')
---@type StaticImporter
local function html(h)
    h:map_token('text', '@string.special.url.html'):map_token('NONE', '@tag.delimiter.html', function(palette, _)
        return { fg = IsDark(palette) and '#838FA7' or '#727376' }
    end)
end

return html
