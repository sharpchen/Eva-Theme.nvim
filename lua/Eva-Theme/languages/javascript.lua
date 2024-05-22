---@type StaticImporter
local function javascript(h)
    h:map_token('logical', { '@keyword.operator.javascript', '@constant.builtin.javascript' })
        :map_token('type', { '@punctuation.special.javascript' })
end

return javascript
