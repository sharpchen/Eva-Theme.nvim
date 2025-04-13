local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function vim_illuminate(h)
  h:map_ui('NONE', { 'IlluminatedWordText', 'IlluminatedWordRead', 'IlluminatedWordWrite' }, function(palette, _)
    return { bg = utils.is_dark(palette) and '#17596B' or '#7FD8DE' }
  end):map_ui('NONE', 'IlluminatedWordWrite', function(p, _)
    return { bg = utils.is_dark(p) and '#66609f' or '#c9bff2' }
  end)
end

return vim_illuminate
