---@type StaticImporter
local function treesitter(h)
    h
        :map('type', { '@attribute', '@constructor', '@type.definition', '@punctuation.delimiter', '@tag.attribute' })
        :map('func',
            { '@function.method', '@function.method.call', '@function', '@function.macro', '@function.method',
                '@function.method.call', '@comment.todo', '@local.definition.function', '@local.definition.method' })
        :map('digit',
            { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float', '@string.escape',
                '@local.definition.constant' })
        :map('logical',
            { '@boolean', '@keyword.coroutine', '@keyword.repeat', '@keyword.return',
                '@keyword.exception', '@keyword.conditional' })
        :map('operator', { '@operator', '@keyword.conditional.ternary' })
        :map('property',
            { '@variable.member', '@property', '@tag.xml', '@comment.error', '@tag', '@tag.builtin',
                '@local.definition.namespace' })
        :map('variable', { '@variable', '@local.definition.var' })
        :map('parameter',
            { '@variable.parameter', '@variable.parameter.builtin', '@comment.warning', '@local.definition.parameter' })
        :map('primitive', { '@type.builtin' })
        :map('declarative',
            { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.import', '@keyword.function',
                '@keyword.function', '@keyword.type', '@keyword.modifier', '@keyword.operator' })
        :map('instanceReference', { '@variable.builtin', '@module.builtin' })
        :map('text', { '@label', '@string', '@string.regexp', '@comment.note' })
        :map('comment', { '@string.documentation', '@comment.documentation' })
end

return treesitter
