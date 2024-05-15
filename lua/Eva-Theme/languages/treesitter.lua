---@type StaticImporter
local function treesitter(h)
    h
        :match('type', { '@attribute', '@constructor' })
        :match('func', { '@function.method', '@function.method.call' })
        :match('digit', { '@number', '@constant', '@constant.builtin', '@constant.macro', '@number.float' })
        :match('logical', { '@boolean' })
        :match('operator', { '@operator' })
        :match('property', { '@label', '@variable.member', '@property' })
        :match('variable', { '@variable' })
        :match('parameter', { '@variable.parameter', '@variable.parameter.builtin' })
        :match('primitive', { '@type.builtin' })
        :match('declarative', { '@keyword.directive.define', '@namespace.builtin', '@keyword', '@keyword.function' })
        :match('instanceReference', { '@variable.builtin', '@module.builtin' })
end

return treesitter
