---@type StaticImporter
local function builtin(h)
    h:match('declarative', { 'DiagnosticOk', 'DiagnosticVirtualTextOk', 'DiagnosticFloatingOk', 'DiagnosticSignOk' })
        :match('text', { 'DiagnosticInfo', 'DiagnosticVirtualTextInfo', 'DiagnosticFloatingInfo', 'DiagnosticSignInfo' })
        :match('parameter',
            { 'DiagnosticWarn', 'DiagnosticVirtualTextWarn', 'DiagnosticFloatingWarn', 'DiagnosticSignWarn' })
        :match('variable',
            { 'DiagnosticHint', 'DiagnosticVirtualTextHint', 'DiagnosticFloatingHint', 'DiagnosticSignHint' })
        :match('instanceReference',
            { 'Error', 'DiagnosticError', 'DiagnosticVirtualTextError', 'DiagnosticFloatingError', 'DiagnosticSignError' })
        :match('variable', { 'CursorLineNr', 'Command', 'Directory', 'SpecialKey' })
        :match('comment', { 'LineNrAbove', 'LineNrBelow' })
        :match('background', 'Normal', function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
        :match('panelBackground', { 'StatusLine' }, function(palette, as)
            return { bg = palette[as], fg = palette['variable'] }
        end)
end

return builtin
