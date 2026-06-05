describe('setup', function()
  it('config.override_palette', function()
    require('Eva-Theme').setup({
      override_palette = {
        dark = function(p)
          return {
            digit = p.dark_base.comment,
          }
        end,
        light = {
          comment = 'red',
        },
      },
    })

    local user_dark = require('Eva-Theme.palette').user_dark
    local dark_base = require('Eva-Theme.palette').dark_base
    local user_light = require('Eva-Theme.palette').user_light
    local light_base = require('Eva-Theme.palette').light_base

    assert.equal(user_dark.digit, dark_base.comment)
    assert.equal(user_light.comment, 'red')
  end)

  it('config.override_highlight', function()
    require('Eva-Theme').setup({
      override_highlight = function(v, p)
        return {
          ['foo'] = { fg = p.current.digit },
        }
      end,
    })

    -- require('Eva-Theme.config'):user_hl_gen(require('Eva-Theme.palette').dark_base)
  end)
end)
