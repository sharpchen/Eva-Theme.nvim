local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function treesitter(h)
  h:map_token('type', {
    '@attribute',
    '@attribute.builtin',
    '@constructor',
    '@type.definition',
    '@tag.attribute',
    '@markup.list.markdown',
    '@type',
  })
    :map_token('func', {
      '@function.builtin',
      '@function.method',
      '@function.method.call',
      '@function',
      '@function.macro',
      '@function.method',
      '@comment.todo',
      '@local.definition.function',
      '@local.definition.method',
      '@markup.link.label',
      '@punctuation.special',
    })
    :map_token('digit', {
      '@number',
      '@constant',
      '@constant.builtin',
      '@constant.macro',
      '@number.float',
      '@local.definition.constant',
      '@string.special',
    })
    :map_token('logical', {
      '@boolean',
      '@keyword.import',
      '@keyword.coroutine',
      '@keyword.repeat',
      '@keyword.return',
      '@keyword.control',
      '@keyword.control.return',
      '@keyword.exception',
      '@keyword.conditional',
      '@keyword.conditional.ternary',
      '@keyword.operator',
    })
    :map_token('NONE', { '@markup', '@punctuation', '@punctuation.bracket' }, function(palette, _)
      return { fg = palette.punctuation }
    end)
    :map_token('operator', { '@operator' })
    :map_token('property', {
      '@property',
      '@tag.xml',
      '@tag',
      '@tag.builtin',
      '@variable.member',
      '@variable.other.member',
      '@local.definition.namespace',
    })
    :map_token('variable', { '@variable', '@local.definition.var' })
    :map_token('parameter', {
      '@variable.parameter',
      '@variable.parameter.builtin',
      '@local.definition.parameter',
      '@string.regexp',
    })
    :map_token('primitive', { '@type.builtin', '@label.markdown' })
    :map_token('declarative', {
      '@keyword.directive.define',
      '@namespace.builtin',
      '@keyword',
      '@keyword.function',
      '@keyword.type',
      '@keyword.modifier',
    })
    :map_token('instanceReference', { '@variable.builtin', '@module.builtin' })
    :map_token('text', {
      '@label',
      '@string',
      '@string.special.path.diff',
      '@string.special.url',
      '@string.special.path',
      '@markup.link',
      '@markup.link.url',
      '@markup.raw',
      '@markup.raw.block',
      '@markup.list',
      '@character',
    })
    :map_token('comment', { '@string.documentation', '@comment', '@comment.documentation' }, function(p, as)
      return { fg = p[as], italic = true }
    end)
    :map_token('info', { '@comment.note' })
    :map_token('warning', { '@comment.warning' })
    :map_token('error', { '@comment.error' })
    :map_token('NONE', { '@string.escape', '@character.special' }, function(palette, _)
      return { fg = palette.escape }
    end)
    :map_token('NONE', { '@diff.minus.diff', '@diff.minus' }, function(palette, _)
      return { fg = palette['git']['diffDeleted'] }
    end)
    :map_token('NONE', { '@diff.plus.diff', '@diff.plus' }, function(palette, _)
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
      '@module',
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
    :map_token('comment', '@punctuation.delimiter')
end

return treesitter
