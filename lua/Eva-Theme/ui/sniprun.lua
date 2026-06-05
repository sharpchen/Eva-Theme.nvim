local utils = require('Eva-Theme.utils')
---@param s Eva-Theme.HighlightSource
local function sniprun(s)
  s:map_ui('NONE', 'SniprunVirtualTextOk', function(_, _)
    return { link = 'LspInlayHint' }
  end):map_ui('NONE', 'SniprunVirtualTextErr', function(_, _)
    return { link = 'DiagnosticVirtualTextError' }
  end)
end

return sniprun
