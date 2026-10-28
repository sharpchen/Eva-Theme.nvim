---@param s Eva-Theme.HighlightSource
local function _extra_hl(s)
  s:map_token('logical', '@Eva-Theme.logical')
    :map_token('NONE', '@Eva-Theme.assignment', function(p)
      return { fg = p.assignment }
    end)
    :map_token('primitive', '@Eva-Theme.primitive')
    :map_token('func', '@Eva-Theme.func')
    :map_token('variable', '@Eva-Theme.variable')
    :map_token('type', '@Eva-Theme.type')
    :map_token('this', '@Eva-Theme.this')
    :map_token('digit', '@Eva-Theme.constant')
    :map_token('property', {
      '@Eva-Theme.property',
      '@Eva-Theme.module',
    })
    :map_token('NONE', '@Eva-Theme.punctuation', function(p)
      return { fg = p.punctuation }
    end)
    :map_token('parameter', '@Eva-Theme.parameter')
    :map_token('declarative', '@Eva-Theme.keyword')
    :map_token('operator', '@Eva-Theme.operator')
end

return _extra_hl
