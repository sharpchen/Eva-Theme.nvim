---@type StaticImporter
local function gitsigns(h)
    h
        :map('diffAdded', { 'GitSignsAdd', 'GitSignsUntracked' })
        :map('diffModified', 'GitSignsChange')
        :map('diffDeleted', 'GitSignsDelete')
        :map('NONE', 'GitSignsCurrentLineBlame', function(palette, _)
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
        end)
end

return gitsigns
