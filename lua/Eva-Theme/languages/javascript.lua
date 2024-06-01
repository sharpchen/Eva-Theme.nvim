---@type StaticImporter
local function javascript(h)
    h:map_token('logical', { '@constant.builtin.javascript' })
        :map_token('func', { '@punctuation.special.javascript' }, function(p, as) -- string interpolation
            return { fg = p[as], nocombine = true }
        end)
        :map_token('declarative', '@keyword.operator.javascript')
end

return javascript
