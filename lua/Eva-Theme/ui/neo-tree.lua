---@type StaticImporter
local function neo_tree(h)
    h:map_ui('comment', 'NeoTreeDimText')
        :map_ui('NONE', { 'NeoTreeGitAdded', }, function(p, _)
            return { fg = p.git.diffAdded }
        end)
        :map_ui('NONE', 'NeoTreeGitUntracked', function(p, _)
            return { fg = p.git.untracked }
        end)
        :map_ui('NONE', 'NeoTreeGitDeleted', function(p, _)
            return { fg = p['git']['diffDeleted'] }
        end)
        :map_ui('NONE', 'NeoTreeGitModified', function(p, _)
            return { fg = p.git.diffModified }
        end)
        :map_ui('panelBackground', { 'NeoTreeNormal', 'NeoTreeNormalNC' }, function(palette, as)
            return { bg = palette[as] }
        end)
        :map_ui('panelBackground', { 'NeoTreeStatusLine', 'NeoTreeStatusLineNC' }, function(palette, as)
            return { bg = palette[as], fg = palette.variable }
        end)
        :map_ui('info', { 'NeoTreeDirectoryIcon', 'NeoTreeDirectoryName' })
        :map_ui('digit', 'NeoTreeTitleBar', function(palette, as)
            return { bg = palette[as], fg = palette.panelBackground }
        end)
        :map_ui('error', 'NeoTreeGitConflict')
        :map_ui('NONE', 'NeoTreeGitIgnored', function(p, _)
            return { fg = p.git.ignored }
        end)
end

return neo_tree
