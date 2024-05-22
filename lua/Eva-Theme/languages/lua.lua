---@type StaticImporter
local function lua(h)
    h:map_token('logical',
        { '@keyword.conditional.lua', '@keyword.repeat.lua', '@keyword.return.lua', '@keyword.operator.lua',
            '@constant.builtin.lua' })
        :map_token('type', { '@punctuation.special.luadoc', '@function.macro.luadoc', '@lsp.type.macro.lua' })
        :map_token('NONE', { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua' },
            function(palette, _)
                return { fg = IsDark(palette) and '#838FA7' or '#727376' }
            end)
        :map_token('parameter', { '@lsp.type.parameter.lua' })
        :map_token('func', { '@function.builtin.lua', '@lsp.typemod.function.defaultLibrary.lua' })
        :map_token('property', { '@lsp.type.property.lua', '@variable.member.lua' })
        :map_token('digit', '@lsp.mod.defaultLibrary.lua')
        :map_token('instanceReference', '@lsp.typemod.variable.definition.lua')
end

return lua
