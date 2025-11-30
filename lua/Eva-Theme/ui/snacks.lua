local utils = require('Eva-Theme.utils')
---@type Eva-Theme.StaticImporter
local function snacks(h)
  h:map_ui('none', 'SnacksPickerMatch', function(p, _)
    return { fg = p.info, bold = true }
  end):map_ui('none', 'SnacksPickerDir', function()
    return { link = 'Identifier' }
  end)
end

return snacks
