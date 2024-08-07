local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function vim_illuminate(h)
  h:map_ui('NONE', { 'IlluminatedWordText', 'IlluminatedWordRead', 'IlluminatedWordWrite' }, function(palette, _)
    return { bg = utils.is_dark(palette) and '#17596B' or '#7FD8DE' }
  end)
end

return vim_illuminate
