local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function builtin(h)
  h:map_token('type', { 'Type', 'StorageClass', 'Structure' })
    :map_token('func', 'Function')
    :map_token('text', { 'String', 'Character', 'SpecialComment', 'Todo' })
    :map_token('digit', { 'Constant', 'Number', 'Float', 'SpecialChar', 'Format' })
    :map_token('logical', { 'Boolean', 'Conditional', 'Repeat', 'Label', 'Exception', 'PreCondit' })
    :map_token('operator', 'Operator')
    :map_token('declarative', { 'Keyword', 'Preproc', 'Include', 'Define', 'Macro', 'Typedef', 'Statement' })
    :map_token('variable', 'Identifier')
    :map_token('instanceReference', {})
    :map_token('comment', 'Comment', function(p, as)
      return { fg = p[as], italic = true }
    end)
    :map_token('NONE', 'Special', function(palette, _) -- escaped characters
      return { fg = palette.escape }
    end)
    :map_token('NONE', 'DiagnosticUnnecessary', function(palette, _)
      return { fg = utils.is_dark(palette) and '#50567C' or '#C8CACE', underdashed = true }
    end)
    :map_token('NONE', 'Delimiter', function(palette, _)
      return { fg = utils.is_dark(palette) and '#838FA7' or '#727376' }
    end)
end

return builtin
