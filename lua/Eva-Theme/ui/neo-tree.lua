---@type StaticImporter
local function neo_tree(h)
    h:map('comment', 'NeoTreeDimText')
        :map('NONE', { 'NeoTreeGitAdded', }, function(p, _)
            return { fg = p.git.diffAdded }
        end)
        :map('NONE', 'NeoTreeGitUntracked', function(p, _)
            return { fg = p.git.untracked }
        end)
        :map('NONE', 'NeoTreeGitDeleted', function(p, _)
            return { fg = p['git']['diffDeleted'] }
        end)
        :map('NONE', 'NeoTreeGitModified', function(p, _)
            return { fg = p.git.diffModified }
        end)
        :map('panelBackground', { 'NeoTreeNormal', 'NeoTreeNormalNC' }, function(palette, as)
            return { bg = palette[as] }
        end)
        :map('panelBackground', { 'NeoTreeStatusLine', 'NeoTreeStatusLineNC' }, function(palette, as)
            return { bg = palette[as], fg = palette.variable }
        end)
        :map('info', { 'NeoTreeDirectoryIcon', 'NeoTreeDirectoryName' })
        :map('panelBackground', 'NeoTreeTitleBar', function(palette, as)
            return { bg = palette[as] }
        end)
        :map('error', 'NeoTreeGitConflict')
        :map('NONE', 'NeoTreeGitIgnored', function(p, _)
            return { fg = p.git.ignored }
        end)
end

return neo_tree
