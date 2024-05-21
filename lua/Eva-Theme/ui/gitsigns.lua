---@type StaticImporter
local function gitsigns(h)
    h
        :map('NONE', { 'GitSignsUntracked' }, function(palette, _)
            return { fg = palette['git']['untracked'] }
        end)
        :map('NONE', { 'GitSignsAdd', }, function(palette, _)
            return { fg = palette['git']['diffAdded'] }
        end)
        :map('NONE', 'GitSignsChange', function(palette, _)
            return { fg = palette['git']['diffModified'] }
        end)
        :map('NONE', 'GitSignsDelete', function(palette, _)
            return { fg = palette['git']['diffDeleted'] }
        end)
        :map('NONE', 'GitSignsCurrentLineBlame', function(palette, _) -- inline blame
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
        end)
end

return gitsigns
