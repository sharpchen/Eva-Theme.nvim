---@type StaticImporter
local function builtin(h)
    h:map('declarative', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
        :map('text',
            { 'MoreMsg', 'Question', 'DiagnosticInfo', 'DiagnosticVirtualTextInfo', 'DiagnosticFloatingInfo',
                'DiagnosticSignInfo', 'RedrawDebugComposed' })
        :map('parameter',
            { 'DiagnosticWarn', 'DiagnosticVirtualTextWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn',
                'RedrawDebugClear' })
        :map('variable',
            { 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' })
        :map('instanceReference',
            { 'Error', 'ErrorMsg', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError',
                'DiagnosticSignError', 'RedrawDebugRecompose', 'NvimInternalError' })
        :map('variable', { 'CursorLineNr', 'Command', 'Directory', 'SpecialKey', 'Title', 'RedrawDebugNormal' })
        :map('comment', { 'LineNr', 'LineNrAbove', 'LineNrBelow', 'ColorColumn' })
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
        :map('background', { 'DiffAdd' }, function(palette, as)
            return { bg = palette[as], fg = '#44c145' }
        end)
        :map('background', { 'DiffChange' }, function(palette, as)
            return { bg = palette[as], fg = '#9277e6' }
        end)
        :map('background', { 'DiffDelete' }, function(palette, as)
            return { bg = palette[as], fg = '#f14c4c' }
        end)
        :map_dark('#394e75', { 'VisualNOS', 'Visual' }) -- selection background in visual mode
        :map_dark('#2f323c', 'CursorLine')
        :map_light('#b0cbf7', { 'VisualNOS', 'Visual' })
        :map_light('#e3e6ed', 'CursorLine')
        :map('digit', { 'MatchParen' }, function(palette, as)
            return { bg = palette[as] }
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
end
return builtin
