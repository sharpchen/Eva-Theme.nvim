local utils = require('Eva-Theme.utils')
---@type Eva-Theme.StaticImporter
local function xml(h)
  h:map_token('NONE', { '@tag.delimiter.xml', 'xmlTag' }, function(palette, _)
    return { fg = utils.is_dark(palette) and '#838FA7' or '#727376', nocombine = true }
  end)
    :map_token('type', 'xmlAttrib')
    :map_token('property', 'xmlTagName')
end

return xml
