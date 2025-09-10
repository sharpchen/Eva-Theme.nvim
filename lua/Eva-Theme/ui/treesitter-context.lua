local utils = require('Eva-Theme.utils')
---@type Eva-Theme.StaticImporter
local function treesitter_context(h)
  h:map_token('background', 'TreesitterContext', function(p, as)
    return { bg = utils.is_dark(p) and utils.lighten(p[as], 30) or utils.darken(p[as], 10) }
  end)
end

return treesitter_context
