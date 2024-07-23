local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function sniprun(h)
  h:map_ui('NONE', 'SniprunVirtualTextOk', function(palette, _)
    return {
      fg = utils.is_dark(palette) and '#8A97C3' or '#888888',
      bg = utils.is_dark(palette) and '#343744' or '#e5e8ee',
    }
  end):map_ui('NONE', 'SniprunVirtualTextErr', function(p, _)
    return { fg = utils.is_dark(p) and '#F36464' or '#E45454', bg = utils.is_dark(p) and '#3D3037' or '#EBDAE0' }
  end)
end

return sniprun
