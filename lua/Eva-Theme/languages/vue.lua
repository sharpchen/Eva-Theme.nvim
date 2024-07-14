local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function vue(h)
  h:map_token('NONE', '@tag.delimiter.vue', function(palette, _)
    return { fg = utils.isDark(palette) and '#838FA7' or '#727376' }
  end):map_token('text', '@string.special.url.vue')
end

return vue
