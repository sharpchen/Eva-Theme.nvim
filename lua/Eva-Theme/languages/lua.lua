local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function lua(h)
  h:map_token('logical', {
    '@keyword.conditional.lua',
    '@keyword.repeat.lua',
    '@keyword.return.lua',
    '@constant.builtin.lua',
  })
    :map_token('type', { '@function.macro.luadoc', '@lsp.type.macro.lua' })
    :map_token(
      'NONE',
      { '@punctuation.bracket.luadoc', '@punctuation.bracket.lua', '@constructor.lua', '@punctuation.special.luadoc' },
      function(palette, _)
        return { fg = utils.is_dark(palette) and '#838FA7' or '#727376', nocombine = true }
      end
    )
    :map_token('parameter', { '@lsp.type.parameter.lua' })
    :map_token('func', { '@function.builtin.lua', '@lsp.typemod.function.defaultLibrary.lua' })
    :map_token('property', { '@variable.member.lua' })
    :map_token('digit', '@lsp.mod.defaultLibrary.lua')
    :map_token('instanceReference', '@lsp.typemod.variable.definition.lua')
    :map_token('NONE', '@lsp.type.property.lua')
    :map_token('text', '@string.regexp.lua')
end

return lua
