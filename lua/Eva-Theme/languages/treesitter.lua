local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function treesitter(h)
  h:map_token('type', { '@attribute', '@constructor', '@type.definition', '@tag.attribute', '@markup.list.markdown' })
    :map_token('func', {
      '@function.method',
      '@function.method.call',
      '@function',
      '@function.macro',
      '@function.method',
      '@comment.todo',
      '@local.definition.function',
      '@local.definition.method',
      '@markup.link.label',
    })
    :map_token(
      'digit',
      { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float', '@local.definition.constant' }
    )
    :map_token('logical', {
      '@boolean',
      '@keyword.coroutine',
      '@keyword.repeat',
      '@keyword.return',
      '@keyword.exception',
      '@keyword.conditional',
      '@keyword.conditional.ternary',
    })
    :map_token(
      'NONE',
      { '@punctuation.bracket', '@punctuation.delimiter', '@punctuation.special' },
      function(palette, _)
        return { fg = utils.is_dark(palette) and '#838FA7' or '#727376' }
      end
    )
    :map_token('operator', { '@operator' })
    :map_token(
      'property',
      { '@property', '@tag.xml', '@tag', '@tag.builtin', '@variable.member', '@local.definition.namespace' }
    )
    :map_token('variable', { '@variable', '@local.definition.var' })
    :map_token('parameter', {
      '@variable.parameter',
      '@variable.parameter.builtin',
      '@local.definition.parameter',
      '@character.special',
      '@string.regexp',
    })
    :map_token('primitive', { '@type.builtin', '@label.markdown' })
    :map_token('declarative', {
      '@keyword.directive.define',
      '@namespace.builtin',
      '@keyword',
      '@keyword.import',
      '@keyword.function',
      '@keyword.function',
      '@keyword.type',
      '@keyword.modifier',
      '@keyword.operator',
    })
    :map_token('instanceReference', { '@variable.builtin', '@module.builtin' })
    :map_token('text', {
      '@label',
      '@string',
      '@string.special.path.diff',
      '@string.special.url',
      '@string.special.path',
      '@markup.link.url',
      '@markup.raw',
      '@markup.raw.block',
      '@markup.list',
    })
    :map_token('comment', { '@string.documentation' })
    :map_token('info', { '@comment.note' })
    :map_token('warning', { '@comment.warning' })
    :map_token('error', { '@comment.error' })
    :map_token('comment', '@comment.documentation', function(p, as)
      return { fg = p[as], italic = true }
    end)
    :map_token('NONE', '@string.escape', function(palette, _)
      return { fg = utils.is_dark(palette) and '#8A97C3' or '#888888' }
    end)
    :map_token('NONE', '@diff.minus.diff', function(palette, _)
      return { fg = palette['git']['diffDeleted'] }
    end)
    :map_token('NONE', '@diff.plus.diff', function(palette, _)
      return { fg = palette['git']['diffAdded'] }
    end)
    :map_token('NONE', '@diff.delta', function(palette, _)
      return { fg = palette.git.diffModified }
    end)
    :map_token('property', {
      '@markup.heading',
      '@markup.heading.1',
      '@markup.heading.2',
      '@markup.heading.3',
      '@markup.heading.4',
      '@markup.heading.5',
      '@markup.heading.6',
    })
    :map_token('NONE', '@markup.italic', function(_, _)
      return { fg = '#C57BDB', italic = true }
    end)
    :map_token('NONE', '@markup.strong', function(p, _)
      return { fg = utils.is_dark(p) and '#E4BF7F' or '#F0AA0B', bold = true }
    end)
    :map_token('NONE', '@markup.raw.block.markdown', function(palette, _)
      return { fg = utils.is_dark(palette) and '#8792AA' or '#A0A1A7' }
    end)
end

return treesitter
