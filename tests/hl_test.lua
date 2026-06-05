describe('setup', function()
  it('config.override_palette', function()
    local palette = require('Eva-Theme.palette'):from_variant('light')
    local H = require('Eva-Theme.highlight')

    local function javascript(s)
      s:map_token('logical', { '@constant.builtin.javascript' })
        :map_token('func', { '@punctuation.special.javascript' }, function(p, as) -- string interpolation
          return { fg = p[as], nocombine = true }
        end)
        :map_token('property', '@lsp.type.namespace.javascript')
        :map_token('NONE', '@tag.delimiter.javascript', function(p, _)
          return { fg = p.punctuation }
        end)
    end

    H:add_source(javascript)
  end)
end)
