---@type StaticImporter
local function treesitter(h)
    h
        :map('type', { '@attribute', '@constructor' })
        :map('func', { '@function.method', '@function.method.call' })
        :map('digit', { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float' })
        :map('logical', { '@boolean' })
        :map('operator', { '@operator' })
        :map('property', { '@variable.member', '@property' })
        :map('variable', { '@variable' })
        :map('parameter', { '@variable.parameter', '@variable.parameter.builtin' })
        :map('primitive', { '@type.builtin' })
        :map('declarative', { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.function' })
        :map('instanceReference', { '@variable.builtin', '@module.builtin' })
        :map('text', '@label')
end

return treesitter
