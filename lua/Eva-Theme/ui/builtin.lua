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
        :map('diffAdded', 'healthSuccess')
        :map('background', 'Normal', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('background', 'EndOfBuffer')
        :map('background', 'SignColumn', function(palette, as)
            return { bg = palette[as] }
        end)
        :map('panelBackground', { 'StatusLine' }, function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('panelBackground', 'Pmenu', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :map('type', 'PmenuSel', function(palette, as)
            return { bg = palette[as], fg = palette['panelBackground'] }
        end)
        :map('digit', 'TermCursor')
        :map('variable', 'DiagnosticUnderlineHint', function(palette, as)
            return { underdotted = true, sp = palette[as] }
        end)
        :map('diffAdded', { 'DiffAdd' })
        :map('diffModified', { 'DiffChange' })
        :map('diffDeleted', { 'DiffDelete' })
        :map_dark('#394e75', { 'VisualNOS', 'Visual' }) -- selection background in visual mode
        :map_dark('#2f323c', 'CursorLine')
        :map_light('#b0cbf7', { 'VisualNOS', 'Visual' })
        :map_light('#e3e6ed', 'CursorLine')
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
