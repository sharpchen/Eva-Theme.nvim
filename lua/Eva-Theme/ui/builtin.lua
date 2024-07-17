local utils = require('Eva-Theme.utils')
---@type StaticImporter
local function builtin(h)
  h
    :map_ui('declarative', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
    :map_ui(
      'info',
      { 'MoreMsg', 'Question', 'DiagnosticInfo', 'DiagnosticFloatingInfo', 'DiagnosticSignInfo', 'RedrawDebugComposed' }
    )
    :map_ui(
      'warning',
      { 'DiagnosticWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn', 'RedrawDebugClear', 'WarningMsg' }
    )
    :map_ui('text', { 'DiagnosticHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' }, function(palette, as)
      return { fg = palette[as] } --utils.isDark(palette) and '#50567C' or '#C8CACE' }
    end)
    :map_ui('error', {
      'Error',
      'ErrorMsg',
      'DiagnosticError',
      'DiagnosticFloatingError',
      'DiagnosticSignError',
      'RedDebugRecompose',
      'NvimInternalError',
    })
    :map_ui('variable', { 'CursorLineNr', 'Command', 'Directory', 'SpecialKey', 'Title', 'RedrawDebugNormal' })
    :map_ui('comment', { 'LineNr', 'ColorColumn' })
    :map_ui('NONE', { 'LineNrAbove', 'LineNrBelow' }, function(palette, _)
      return { fg = utils.is_dark(palette) and '#50567C' or '#C8CACE' }
    end)
    :map_ui('NONE', 'healthSuccess', function(palette, _) --neovim checkhealth report
      return { fg = palette['git']['diffAdded'] }
    end)
    :map_ui('background', 'Normal', function(palette, as)
      return { bg = palette[as], fg = palette['variable'] }
    end)
    :map_ui('background', 'EndOfBuffer') -- ~ sign at th end of each buffer
    :map_ui('background', 'SignColumn', function(palette, as)
      return { bg = palette[as] }
    end)
    :map_ui('panelBackground', { 'StatusLine', 'StatusLineNC', 'NormalFloat' }, function(palette, as)
      return { bg = palette[as], fg = palette['variable'] }
    end)
    :map_ui('panelBackground', 'Pmenu', function(palette, as)
      return { bg = palette[as], fg = palette['variable'] }
    end)
    :map_ui('NONE', 'PmenuSel', function(palette, _)
      return {
        bg = utils.is_dark(palette) and '#2F3F5C' or '#CAD7ED',
        fg = utils.is_dark(palette) and '#D7DAE0' or '#5D5D5F',
      }
    end)
    :map_ui('digit', 'TermCursor')
    :map_ui('variable', 'DiagnosticUnderlineHint', function(palette, as)
      return { underdotted = true, sp = palette[as] }
    end)
    :map_ui('NONE', { 'DiffAdd' }, function(p, _)
      return { fg = p['git']['diffAdded'] }
    end)
    :map_ui('NONE', { 'DiffChange' }, function(p, _)
      return { fg = p['git']['diffModified'] }
    end)
    :map_ui('NONE', { 'DiffDelete' }, function(p, _)
      return { fg = p['git']['diffDeleted'] }
    end)
    :map_ui('NONE', { 'VisualNOS', 'Visual' }, function(p, _) -- selection background in visual mode
      return { bg = utils.is_dark(p) and '#394E75' or '#B0CBF7' }
    end)
    :map_ui('NONE', 'CursorLine', function(p, _)
      return { bg = utils.is_dark(p) and '#2F323C' or '#E3E6ED' }
    end)
    :map_ui('digit', { 'MatchParen' }, function(palette, as)
      return { fg = palette[as] }
    end)
    :map_ui('digit', { 'Cursor', 'iCursor' }, function(palette, as)
      return { bg = palette[as], fg = palette[as] }
    end)
    :map_ui('background', 'TabLineSel', function(palette, as)
      return { bg = palette[as], fg = palette['variable'] }
    end)
    :map_ui('panelBackground', 'TabLine', function(palette, as)
      return { bg = palette[as], fg = palette['comment'] }
    end)
    :map_ui('declarative', { 'FloatBorder', 'FloatTitle' }, function(palatte, as)
      return { fg = palatte[as], bg = palatte.panelBackground }
    end)
    --#region inline diagnostic
    :map_ui('NONE', 'DiagnosticVirtualTextError', function(p, _)
      return { fg = utils.is_dark(p) and '#F36464' or '#E45454', bg = utils.is_dark(p) and '#3D3037' or '#EBDAE0' }
    end)
    :map_ui('NONE', 'DiagnosticVirtualTextWarn', function(p, _)
      return { fg = utils.is_dark(p) and '#EF973A' or '#FB942F', bg = utils.is_dark(p) and '#463D3A' or '#E7DBD4' }
    end)
    :map_ui('text', 'DiagnosticVirtualTextHint', function(p, as)
      return { fg = p[as], bg = utils.is_dark(p) and '#495949' or '#BED7C5' }
    end)
    :map_ui('NONE', 'DiagnosticVirtualTextInfo', function(p, _)
      return { fg = utils.is_dark(p) and '#00b7cb' or '#00c1ea', bg = utils.is_dark(p) and '#233e4b' or '#cde7f3' }
    end)
    --#endregion
    :map_ui('declarative', 'WinSeparator', function(p, as)
      return { fg = p[as] } --utils.isDark(p) and '#181A1F' or '#c4c7ce' }
    end)
    :map_ui('NONE', 'LspInlayHint', function(palette, _)
      return {
        fg = utils.is_dark(palette) and '#8A97C3' or '#888888',
        bg = utils.is_dark(palette) and '#343744' or '#e5e8ee',
      }
    end)
end
return builtin
