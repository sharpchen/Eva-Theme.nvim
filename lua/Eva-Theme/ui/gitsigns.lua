local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function gitsigns(h)
  h:map_ui('NONE', { 'GitSignsUntracked' }, function(palette, _)
    return { fg = palette['git']['untracked'] }
  end)
    :map_ui('NONE', { 'GitSignsAdd' }, function(palette, _)
      return { fg = palette['git']['diffAdded'] }
    end)
    :map_ui('NONE', 'GitSignsChange', function(palette, _)
      return { fg = palette['git']['diffModified'] }
    end)
    :map_ui('NONE', 'GitSignsDelete', function(palette, _)
      return { fg = palette['git']['diffDeleted'] }
    end)
    :map_ui('NONE', 'GitSignsDeletePreview', function(p, _)
      return { bg = p.git.bg.diffDeleted }
    end)
    :map_ui('NONE', 'GitSignsAddPreview', function(p, _)
      return { bg = p.git.bg.diffAdded }
    end)
    :map_ui('NONE', { 'GitSignsAddInline', 'GitSignsAddLnInline', 'GitSignsAddVirtLnInline' }, function(p, _)
      return { bg = p.git.bg.diffWordAdded }
    end)
    :map_ui('NONE', { 'GitSignsDeleteInline', 'GitSignsDeleteLnInline', 'GitSignsDeleteVirtLnInline' }, function(p, _)
      return { bg = p.git.bg.diffWordDeleted }
    end)
    :map_ui('NONE', { 'GitSignsChangeInline', 'GitSignsChangeLnInline', 'GitSignsChangeVirtLnInline' }, function(_, _)
      return { link = 'DiffText' }
    end)
    :map_ui('NONE', 'GitSignsCurrentLineBlame', function(palette, _) -- inline blame
      return { fg = utils.is_dark(palette) and '#50567C' or '#C8CACE' }
    end)
end

return gitsigns
