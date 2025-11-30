---@type Eva-Theme.StaticImporter
local function javascript(h)
  h:map_token('logical', { '@constant.builtin.javascript' })
    :map_token('func', { '@punctuation.special.javascript' }, function(p, as) -- string interpolation
      return { fg = p[as], nocombine = true }
    end)
    :map_token('property', '@lsp.type.namespace.javascript')
    :map_token('NONE', '@tag.delimiter.javascript', function(p, _)
      return { fg = p.punctuation }
    end)
end

return javascript
