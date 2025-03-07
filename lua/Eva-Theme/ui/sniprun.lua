local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function sniprun(h)
  h:map_ui('NONE', 'SniprunVirtualTextOk', function(_, _)
    return { link = 'LspInlayHint' }
  end):map_ui('NONE', 'SniprunVirtualTextErr', function(_, _)
    return { link = 'DiagnosticVirtualTextError' }
  end)
end

return sniprun
