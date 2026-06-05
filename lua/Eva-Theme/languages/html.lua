local utils = require('Eva-Theme.utils')
---@param s Eva-Theme.HighlightSource
local function html(s)
  s:map_token('text', { '@string.special.url.html', '@markup.link.label.html' })
    :map_token('NONE', '@tag.delimiter.html', function(palette, _)
      return { fg = utils.is_dark(palette) and '#838FA7' or '#727376' }
    end)
    :map_token('variable', '@markup.heading.html')
end

return html
