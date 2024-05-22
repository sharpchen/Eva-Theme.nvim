---@type StaticImporter
local function gitsigns(h)
    h
        :map_ui('NONE', { 'GitSignsUntracked' }, function(palette, _)
            return { fg = palette['git']['untracked'] }
        end)
        :map_ui('NONE', { 'GitSignsAdd', }, function(palette, _)
            return { fg = palette['git']['diffAdded'] }
        end)
        :map_ui('NONE', 'GitSignsChange', function(palette, _)
            return { fg = palette['git']['diffModified'] }
        end)
        :map_ui('NONE', 'GitSignsDelete', function(palette, _)
            return { fg = palette['git']['diffDeleted'] }
        end)
        :map_ui('NONE', 'GitSignsCurrentLineBlame', function(palette, _) -- inline blame
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
        end)
end

return gitsigns
