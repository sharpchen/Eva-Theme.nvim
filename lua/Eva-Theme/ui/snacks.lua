local utils = require('Eva-Theme.utils')
---@param s Eva-Theme.HighlightSource
local function snacks(s)
  s:map_ui('none', 'SnacksPickerMatch', function(p, _)
    return { fg = p.info, bold = true }
  end):map_ui('none', 'SnacksPickerDir', function()
    return { link = 'Identifier' }
  end)
end

return snacks
