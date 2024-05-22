require('Eva-Theme.utils')
---@type StaticImporter
local function builtin(h)
    h:map_ui('declarative', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
        :map_ui('info',
            { 'MoreMsg', 'Question', 'DiagnosticInfo', 'DiagnosticVirtualTextInfo', 'DiagnosticFloatingInfo',
                'DiagnosticSignInfo', 'RedrawDebugComposed' })
        :map_ui('warning',
            { 'Diagnosticarn', 'DiagnosticVirtualTextWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn',
                'RedrawDebugClear', 'WarningMsg' })
        :map_ui('NONE',
            { 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' },
            function(palette, _)
                return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
            end)
        :map_ui('error',
            { 'Error', 'ErrorMsg', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError',
                'DiagnosticSignError', 'RedDebugRecompose', 'NvimInternalError' })
        :map_ui('variable', { 'CursorLineNr', 'Command', 'Directory', 'SpecialKey', 'Title', 'RedrawDebugNormal' })
        :map_ui('comment', { 'LineNr', 'ColorColumn' })
        :map_ui('NONE', { 'LineNrAbove', 'LineNrBelow', }, function(palette, _)
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
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
        :map_ui('panelBackground', { 'StatusLine', 'StatusLineNC' }, function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map_ui('panelBackground', 'Pmenu', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map_ui('NONE', 'PmenuSel', function(palette, _)
            return { bg = IsDark(palette) and '#2F3F5C' or '#CAD7ED', fg = IsDark(palette) and '#D7DAE0' or '#5D5D5F' }
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
        :map_dark('#394E75', { 'VisualNOS', 'Visual' }) -- selection background in visual mode
        :map_dark('#2F323C', 'CursorLine')
        :map_light('#B0CBF7', { 'VisualNOS', 'Visual' })
        :map_light('#E3E6ED', 'CursorLine')
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
        :map_ui('NONE', 'FloatBorder', function(palette, _)
            return { fg = IsDark(palette) and '#181A1F' or '#CED1D7' }
        end)
end
return builtin
