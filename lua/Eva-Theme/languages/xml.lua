local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function xml(h)
  h:map_token('NONE', '@tag.delimiter.xml', function(palette, _)
    return { fg = utils.isDark(palette) and '#838FA7' or '#727376', nocombine = true }
  end)
end

return xml
