---@type StaticImporter
local function lua(h)
    h:match('logical', { '@keyword.conditional.lua', '@keyword.repeat.lua', '@keyword.return.lua' })
        :match('type', { '@punctuation.special.luadoc', '@function.macro.luadoc' })
        :match('variable', { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua' })
        :match('parameter', { '@lsp.type.parameter.lua' })
        :match('func', { '@function.builtin.lua', '@lsp.typemod.function.defaultLibrary.lua' })
        :match('property', { '@lsp.type.property.lua' })
        :match('digit', '@lsp.mod.defaultLibrary.lua')
        :match('instanceReference', '@lsp.typemod.variable.definition.lua')
end

return lua
