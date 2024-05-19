---@type StaticImporter
local function javascript(h)
    h:map('logical', { '@keyword.operator.javascript', '@constant.builtin.javascript' })
        :map('type', { '@punctuation.special.javascript' })
end

return javascript
