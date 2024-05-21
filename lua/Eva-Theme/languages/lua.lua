---@type StaticImporter
local function lua(h)
    h:map('logical',
        { '@keyword.conditional.lua', '@keyword.repeat.lua', '@keyword.return.lua', '@keyword.operator.lua' })
        :map('type', { '@punctuation.special.luadoc', '@function.macro.luadoc' })
        :map('NONE', { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua' },
            function(palette, _)
                return { fg = IsDark(palette) and '#838FA7' or '#727376' }
            end)
        :map('parameter', { '@lsp.type.parameter.lua' })
        :map('func', { '@function.builtin.lua', '@lsp.typemod.function.defaultLibrary.lua' })
        :map('property', { '@lsp.type.property.lua', '@variable.member.lua' })
        :map('digit', '@lsp.mod.defaultLibrary.lua')
        :map('instanceReference', '@lsp.typemod.variable.definition.lua')
end

return lua
