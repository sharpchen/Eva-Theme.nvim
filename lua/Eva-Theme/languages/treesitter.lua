require('Eva-Theme.utils')
---@type StaticImporter
local function treesitter(h)
    h
        :map_token('type', { '@attribute', '@constructor', '@type.definition', '@tag.attribute' })
        :map_token('func',
            { '@function.method', '@function.method.call', '@function', '@function.macro', '@function.method',
                '@comment.todo', '@local.definition.function', '@local.definition.method' })
        :map_token('digit',
            { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float',
                '@local.definition.constant' })
        :map_token('logical',
            { '@boolean', '@keyword.coroutine', '@keyword.repeat', '@keyword.return',
                '@keyword.exception', '@keyword.conditional', '@keyword.conditional.ternary', })
        :map_token('NONE', { '@punctuation.bracket', '@punctuation.delimiter' }, function(palette, _)
            return { fg = IsDark(palette) and '#838FA7' or '#727376' }
        end)
        :map_token('operator', { '@operator', })
        :map_token('property',
            { '@property', '@tag.xml', '@comment.error', '@tag', '@tag.builtin',
                '@local.definition.namespace' })
        :map_token('variable', { '@variable', '@variable.member', '@local.definition.var', '@punctuation.delimiter', })
        :map_token('parameter',
            { '@variable.parameter', '@variable.parameter.builtin', '@comment.warning', '@local.definition.parameter' })
        :map_token('primitive', { '@type.builtin' })
        :map_token('declarative',
            { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.import', '@keyword.function',
                '@keyword.function', '@keyword.type', '@keyword.modifier', '@keyword.operator' })
        :map_token('instanceReference', { '@variable.builtin', '@module.builtin' })
        :map_token('text', { '@label', '@string', '@string.regexp', '@comment.note', '@string.special.path.diff' })
        :map_token('comment', { '@string.documentation', '@comment.documentation' })
        :map_token('NONE', '@string.escape', function(palette, _)
            return { fg = IsDark(palette) and '#8A97C3' or '#888888' }
        end)
        :map_token('NONE', '@diff.minus.diff', function(palette, _)
            return { fg = palette['git']['diffDeleted'] }
        end)
        :map_token('NONE', '@diff.plus.diff', function(palette, _)
            return { fg = palette['git']['diffAdded'] }
        end)
end

return treesitter
