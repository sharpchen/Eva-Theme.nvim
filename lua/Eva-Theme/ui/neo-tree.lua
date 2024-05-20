---@type StaticImporter
local function neo_tree(h)
    h:map('comment', 'NeoTreeDimText')
        :map('diffAdded', 'NeoTreeGitAdded')
        :map('diffDeleted', 'NeoTreeGitDeleted')
        :map('diffModified', 'NeoTreeGitModified')
        :map('diffAdded', 'NeoTreeGitUntracked')
end

return neo_tree
