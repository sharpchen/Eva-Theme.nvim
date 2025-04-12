---@type StaticImporter
local function blink(h)
  h:map_ui('func', {
    'BlinkCmpKindMethod',
    'BlinkCmpKindFunction',
  })
    :map_ui('type', {
      'BlinkCmpKindClass',
      'BlinkCmpKindInterface',
      'BlinkCmpKindConstructor',
      'BlinkCmpKindModule',
      'BlinkCmpKindStruct',
    })
    :map_ui('NONE', {
      'BlinkCmpKindText',
      'BlinkCmpKindReference',
    }, function(p, _)
      return { fg = p.inlay_hint.bg }
    end)
    :map_ui('variable', {
      'BlinkCmpKindVariable',
      'BlinkCmpKindFolder',
      'BlinkCmpKindFile',
    })
    :map_ui('property', {
      'BlinkCmpKindField',
      'BlinkCmpKindProperty',
    })
    :map_ui('digit', {
      'BlinkCmpKindUnit',
      'BlinkCmpKindValue',
      'BlinkCmpKindEnum',
      'BlinkCmpKindEnumMember',
      'BlinkCmpKindConstant',
    })
    :map_ui('primitive', { 'BlinkCmpKindEvent', 'BlinkCmpKindTypeParameter' })
    :map_ui('operator', { 'BlinkCmpKindOperator' })
    :map_ui('declarative', {
      'BlinkCmpKindKeyword',
      'BlinkCmpKindSnippet',
      'BlinkCmpKindColor',
    })
    :map_ui('NONE', 'BlinkCmpGhostText', function(p, _)
      return { fg = p.inlay_hint.fg }
    end)
    :map_ui('NONE', 'BlinkCmpLabelDeprecated', function(p, _)
      return { fg = p.comment }
    end)
    :map_ui('panelBackground', { 'BlinkCmpDoc', 'BlinkCmpDocBorder', 'BlinkCmpSignatureHelp' }, function(p, as)
      return { bg = p[as] }
    end)
    :map_ui('NONE', 'BlinkCmpLabelMatch', function(p, _)
      return { fg = p.info, bold = true }
    end)
    :map_ui('NONE', 'BlinkCmpMenuSelection', function(_, _)
      return { link = 'PmenuSel' }
    end)
end
return blink
