---@type StaticImporter
local function css(h)
    h:map_token('parameter', '@variable.css')
        :map_token('instanceReference', '@keyword.modifier.css')
end

return css
