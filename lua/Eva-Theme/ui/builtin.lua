local utils = require('Eva-Theme.utils')

---@param s Eva-Theme.HighlightSource
local function builtin(s)
  s
    :map_ui('text', { 'manReference', 'Underlined' }, function(p, as)
      return { fg = p[as], underline = true }
    end)
    :map_ui('info', { 'MoreMsg', 'Question', 'RedrawDebugComposed' })
    :map_ui('warning', { 'RedrawDebugClear', 'WarningMsg' })
    :map_ui('error', {
      'Error',
      'ErrorMsg',
      'RedDebugRecompose',
      'NvimInternalError',
    })
    :map_ui('variable', { 'CursorLineNr', 'Command', 'SpecialKey', 'Title', 'RedrawDebugNormal' })
    :map_ui('comment', 'LineNr')
    :map_ui('NONE', 'ColorColumn', function(p, _)
      return { bg = utils.is_dark(p) and '#495949' or '#bed7c5' }
    end)
    :map_ui('NONE', { 'LineNrAbove', 'LineNrBelow' }, function(p, _)
      return { fg = utils.is_dark(p) and '#50567C' or '#C8CACE' }
    end)
    :map_ui('NONE', 'healthSuccess', function(p, _) --neovim checkhealth report
      return { fg = p['git']['diffAdded'] }
    end)
    :map_ui('background', 'Normal', function(p, as)
      return { bg = p[as], fg = p['variable'] }
    end)
    :map_ui('background', 'EndOfBuffer') -- ~ sign at th end of each buffer
    :map_ui('background', { 'SignColumn', 'WinBar', 'WinBarNC' }, function(p, as)
      return { bg = p[as] }
    end)
    :map_ui('NONE', 'NormalFloat', function(p, as)
      return { fg = p.inlay_hint.fg, bg = p.list_widget_bg }
    end)
    :map_ui('NONE', { 'StatusLine', 'StatusLineNC' }, function(_, _)
      return { link = 'CursorLine' }
    end)
    :map_ui('NONE', 'Pmenu', function(p, as)
      return { bg = p.list_widget_bg, fg = p['variable'] }
    end)
    :map_ui('NONE', 'PmenuMatch', function(p, as)
      return {
        fg = p.info,
        bold = true,
      }
    end)
    :map_ui('NONE', 'PmenuSel', function(p, _)
      return {
        bg = utils.is_dark(p) and '#2F3F5C' or '#CAD7ED',
        -- fg = utils.is_dark(p) and '#D7DAE0' or '#5D5D5F',
        bold = true,
      }
    end)
    :map_ui('digit', 'TermCursor', function(p, as)
      return { bg = p[as], fg = p.background }
    end)
    :map_ui('NONE', { 'DiffAdd', 'diffAdded' }, function(p, _)
      return { bg = p.git.bg.diffAdded }
    end)
    :map_ui('NONE', 'DiffText', function(p, _)
      return { bg = utils.is_dark(p) and '#485b84' or '#bfd4f7' }
    end)
    :map_ui('NONE', 'DiffChange', function(p, _)
      return { bg = utils.is_dark(p) and '#343547' or '#e2e2f4' } -- 10% alpha of diffModified
    end)
    :map_ui('NONE', { 'DiffDelete', 'diffRemoved' }, function(p, _)
      return { fg = p.git.diffDeleted, bg = p.git.bg.diffDeleted }
    end)
    :map_ui('NONE', { 'VisualNOS', 'Visual' }, function(p, _) -- selection background in visual mode
      return { bg = utils.is_dark(p) and '#394E75' or '#B0CBF7' }
    end)
    :map_ui('NONE', 'CursorLine', function(p, _)
      return { bg = utils.is_dark(p) and '#2F323C' or '#E3E6ED' }
    end)
    :map_ui('NONE', 'Folded', function(p, _)
      return { bg = utils.is_dark(p) and '#31394c' or '#d2daed' }
    end)
    :map_ui('digit', 'MatchParen', function(p, as)
      return { fg = p[as], bg = utils.is_dark(p) and '#945e52' or '#f2c5b9' }
    end)
    :map_ui('digit', { 'Cursor', 'iCursor' }, function(p, as)
      return { bg = p[as], fg = 'white' }
    end)
    :map_ui('background', 'TabLineSel', function(p, as)
      return { bg = p[as], fg = p['variable'] }
    end)
    :map_ui('panelBackground', 'TabLine', function(p, as)
      return { bg = p[as], fg = p['comment'] }
    end)
    :map_ui('NONE', { 'FloatBorder', 'FloatTitle' }, function(p, _)
      return { fg = p.inlay_hint.fg }
    end)
    :map_ui('NONE', 'WinSeparator', function(p, _)
      return { fg = p.inlay_hint.fg }
    end)
    :map_ui('NONE', 'LspInlayHint', function(p, _)
      return {
        fg = p.inlay_hint.fg,
        bg = p.inlay_hint.bg,
      }
    end)
    :map_ui('func', 'Directory')
    :map_ui('NONE', 'QuickFixLine', function(p, _)
      return {
        bg = utils.is_dark(p) and '#2F3F5C' or '#CAD7ED',
        bold = true,
      }
    end)
    :map_ui('property', { 'Title', 'manSubHeading' })
    :map_ui('NONE', 'manOptionDesc', function(_, _)
      return { fg = '#C57BDB' }
    end)

  --#region dignostic
  s
    :map_ui('error', {
      'DiagnosticError',
      'DiagnosticFloatingError',
      'DiagnosticSignError',
    })
    :map_ui('NONE', { 'DiagnosticUnnecessary', 'DiagnosticHint' }, function(p, _)
      return { fg = utils.is_dark(p) and '#50567C' or '#C8CACE' }
    end)
    :map_ui('text', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
    :map_ui('info', { 'DiagnosticInfo', 'DiagnosticFloatingInfo', 'DiagnosticSignInfo', 'RedrawDebugComposed' })
    :map_ui('warning', { 'DiagnosticWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn' })
    :map_ui('text', { 'DiagnosticFloatingHint', 'DiagnosticSignHint' }, function(p, as)
      return { fg = p[as] } --utils.isDark(p) and '#50567C' or '#C8CACE' }
    end)
    --#region underline
    :map_ui('variable', 'DiagnosticUnderlineHint', function(p, as)
      return { underdotted = true, sp = p[as] }
    end)
    :map_ui('error', 'DiagnosticUnderlineError', function(p, as)
      return { sp = p[as], undercurl = true }
    end)
    :map_ui('warning', 'DiagnosticUnderlineWarn', function(p, as)
      return { sp = p[as], undercurl = true }
    end)
    :map_ui('info', 'DiagnosticUnderlineInfo', function(p, as)
      return { sp = p[as], undercurl = true }
    end)
    --#endregion underline
    --#region NOTE: inline diagnostic
    :map_ui(
      'NONE',
      'DiagnosticVirtualTextError',
      function(p, _)
        return { fg = utils.is_dark(p) and '#F36464' or '#E45454', bg = utils.is_dark(p) and '#3D3037' or '#EBDAE0' }
      end
    )
    :map_ui('NONE', 'DiagnosticVirtualTextWarn', function(p, _)
      return { fg = utils.is_dark(p) and '#EF973A' or '#FB942F', bg = utils.is_dark(p) and '#463D3A' or '#E7DBD4' }
    end)
    :map_ui('NONE', 'DiagnosticVirtualTextHint', function(p, _)
      return { bg = p.inlay_hint.bg, fg = utils.is_dark(p) and '#50567C' or '#C8CACE' }
    end)
    :map_ui('NONE', 'DiagnosticVirtualTextInfo', function(p, _)
      return { fg = utils.is_dark(p) and '#00b7cb' or '#00c1ea', bg = utils.is_dark(p) and '#233e4b' or '#cde7f3' }
    end)
    :map_ui('NONE', { 'Search' }, function(p)
      return { bg = p.search_match_bg }
    end)
    :map_ui('NONE', { 'CurSearch' }, function(p)
      return { bg = p.current_search_match_bg }
    end)
  --#endregion
  --#endregion
end
return builtin
