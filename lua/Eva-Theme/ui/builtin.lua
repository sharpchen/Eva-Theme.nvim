require('Eva-Theme.utils')
---@type StaticImporter
local function builtin(h)
    h:map('declarative', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
        :map('info',
            { 'MoreMsg', 'Question', 'DiagnosticInfo', 'DiagnosticVirtualTextInfo', 'DiagnosticFloatingInfo',
                'DiagnosticSignInfo', 'RedrawDebugComposed' })
        :map('warning',
            { 'Diagnosticarn', 'DiagnosticVirtualTextWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn',
                'RedrawDebugClear', 'WarningMsg' })
        :map('NONE',
            { 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' },
            function(palette, _)
                return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
            end)
        :map('error',
            { 'Error', 'ErrorMsg', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError',
                'DiagnosticSignError', 'RedDebugRecompose', 'NvimInternalError' })
        :map('variable', { 'CursorLineNr', 'Command', 'Directory', 'SpecialKey', 'Title', 'RedrawDebugNormal' })
        :map('comment', { 'LineNr', 'ColorColumn' })
        :map('NONE', { 'LineNrAbove', 'LineNrBelow', }, function(palette, _)
            return { fg = IsDark(palette) and '#50567C' or '#C8CACE' }
        end)
        :map('NONE', 'healthSuccess', function(palette, _) --neovim checkhealth report
            return { fg = palette['git']['diffAdded'] }
        end)
        :map('background', 'Normal', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('background', 'EndOfBuffer') -- ~ sign at th end of each buffer
        :map('background', 'SignColumn', function(palette, as)
            return { bg = palette[as] }
        end)
        :map('panelBackground', { 'StatusLine', 'StatusLineNC' }, function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('panelBackground', 'Pmenu', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('NONE', 'PmenuSel', function(palette, _)
            return { bg = IsDark(palette) and '#2F3F5C' or '#CAD7ED', fg = IsDark(palette) and '#D7DAE0' or '#5D5D5F' }
        end)
        :map('digit', 'TermCursor')
        :map('variable', 'DiagnosticUnderlineHint', function(palette, as)
            return { underdotted = true, sp = palette[as] }
        end)
        :map('NONE', { 'DiffAdd' }, function(p, _)
            return { fg = p['git']['diffAdded'] }
        end)
        :map('NONE', { 'DiffChange' }, function(p, _)
            return { fg = p['git']['diffModified'] }
        end)
        :map('NONE', { 'DiffDelete' }, function(p, _)
            return { fg = p['git']['diffDeleted'] }
        end)
        :map_dark('#394E75', { 'VisualNOS', 'Visual' }) -- selection background in visual mode
        :map_dark('#2F323C', 'CursorLine')
        :map_light('#B0CBF7', { 'VisualNOS', 'Visual' })
        :map_light('#E3E6ED', 'CursorLine')
        :map('digit', { 'MatchParen' }, function(palette, as)
            return { fg = palette[as] }
        end)
        :map('digit', { 'Cursor', 'iCursor' }, function(palette, as)
            return { bg = palette[as], fg = palette[as] }
        end)
        :map('background', 'TabLineSel', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('panelBackground', 'TabLine', function(palette, as)
            return { bg = palette[as], fg = palette['comment'] }
        end)
        :map('NONE', 'FloatBorder', function(palette, _)
            return { fg = IsDark(palette) and '#181A1F' or '#CED1D7' }
        end)
end
return builtin
