---@type StaticImporter
local function vue(h)
    h:map('NONE', '@tag.delimiter.vue', function(palette, _)
        return { fg = IsDark(palette) and '#838FA7' or '#727376' }
    end)
        :map('text', '@string.special.url.vue')
end

return vue
