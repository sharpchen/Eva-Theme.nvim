---@type StaticImporter
local function lua(h)
    h:match('logical', { '@keyword.conditional.lua' })
        :match('type', { '@punctuation.special.luadoc', '@function.macro.luadoc' })
        :match('variable', '@punctuation.bracket.luadoc')
        :match('parameter', { '@punctuation.bracket.lua', '@constructor.lua' })
        :match('func', { '@function.builtin.lua' })
end

return lua
