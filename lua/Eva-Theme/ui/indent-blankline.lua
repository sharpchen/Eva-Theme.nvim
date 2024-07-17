local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function indent_blankline(h)
  h:map_ui('comment', 'IblIndent')
    :map_ui('NONE', 'IblScope', function(_, _) -- indent line match
      return { fg = '#C97760' }
    end)
    :map_ui('NONE', 'IblWhitespace', function(palette, _)
      return { fg = utils.is_dark(palette) and '#50567C' or '#C8CACE' }
    end)
end

return indent_blankline
