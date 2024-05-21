require('Eva-Theme.utils')
---@type StaticImporter
local function treesitter(h)
    h
        :map('type', { '@attribute', '@constructor', '@type.definition', '@tag.attribute' })
        :map('func',
            { '@function.method', '@function.method.call', '@function', '@function.macro', '@function.method',
                '@function.method.call', '@comment.todo', '@local.definition.function', '@local.definition.method' })
        :map('digit',
            { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float',
                '@local.definition.constant' })
        :map('logical',
            { '@boolean', '@keyword.coroutine', '@keyword.repeat', '@keyword.return',
                '@keyword.exception', '@keyword.conditional', })
        :map('NONE', { '@punctuation.bracket', }, function(palette, _)
            return { fg = IsDark(palette) and '#838FA7' or '#727376' }
        end)
        :map('operator', { '@operator', '@keyword.conditional.ternary' })
        :map('property',
            { '@property', '@tag.xml', '@comment.error', '@tag', '@tag.builtin',
                '@local.definition.namespace' })
        :map('variable', { '@variable', '@variable.member', '@local.definition.var', '@punctuation.delimiter', })
        :map('parameter',
            { '@variable.parameter', '@variable.parameter.builtin', '@comment.warning', '@local.definition.parameter' })
        :map('primitive', { '@type.builtin' })
        :map('declarative',
            { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.import', '@keyword.function',
                '@keyword.function', '@keyword.type', '@keyword.modifier', '@keyword.operator' })
        :map('instanceReference', { '@variable.builtin', '@module.builtin' })
        :map('text', { '@label', '@string', '@string.regexp', '@comment.note', '@string.special.path.diff' })
        :map('comment', { '@string.documentation', '@comment.documentation' })
        :map('NONE', '@string.escape', function(palette, _)
            return { fg = IsDark(palette) and '#8A97C3' or '#888888' }
        end)
        :map('NONE', '@diff.minus.diff', function(palette, _)
            return { fg = palette['git']['diffDeleted'] }
        end)
        :map('NONE', '@diff.plus.diff', function(palette, _)
            return { fg = palette['git']['diffAdded'] }
        end)
end

return treesitter
