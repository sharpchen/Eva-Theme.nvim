local utils = require('Eva-Theme.utils')
---@param s Eva-Theme.HighlightSource
local function vue(s)
  s:map_token('NONE', '@tag.delimiter.vue', function(palette, _)
    return { fg = utils.is_dark(palette) and '#838FA7' or '#727376' }
  end):map_token('text', '@string.special.url.vue')
end

return vue
