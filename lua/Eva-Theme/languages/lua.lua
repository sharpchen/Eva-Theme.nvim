---@type StaticImporter
local function lua(h)
    h:map('logical', { '@keyword.conditional.lua', '@keyword.repeat.lua', '@keyword.return.lua' })
        :map('type', { '@punctuation.special.luadoc', '@function.macro.luadoc' })
        :map('variable', { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua' })
        :map('parameter', { '@lsp.type.parameter.lua' })
        :map('func', { '@function.builtin.lua', '@lsp.typemod.function.defaultLibrary.lua' })
        :map('property', { '@lsp.type.property.lua' })
        :map('digit', '@lsp.mod.defaultLibrary.lua')
        :map('instanceReference', '@lsp.typemod.variable.definition.lua')
end

return lua
