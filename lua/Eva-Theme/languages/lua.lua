---@type StaticImporter
local function lua(h)
    h:match('logical', { '@keyword.conditional.lua', '@keyword.repeat.lua', '@keyword.return.lua' })
        :match('type', { '@punctuation.special.luadoc', '@function.macro.luadoc' })
        :match('variable', { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua' })
        :match('parameter', {})
        :match('func', { '@function.builtin.lua' })
end

return lua
