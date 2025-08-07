local utils = require('Eva-Theme.utils')
---@type Eva-Theme.StaticImporter
local function snacks(h)
  h:map_ui('none', 'SnacksPickerMatch', function(p, _)
    return { fg = p.info, bold = true }
  end)
end

return snacks
