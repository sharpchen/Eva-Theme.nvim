require('Eva-Theme.utils')
---@type StaticImporter
local function treesitter_context(h)
    h:map_token('background', 'TreesitterContext', function(p, as)
        return { bg = Lighten(p[as], 10) }
    end)
end

return treesitter_context
