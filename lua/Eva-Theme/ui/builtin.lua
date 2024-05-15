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
        :match('background', 'Normal')
        :match('panelBackground', { 'StatusLine' })
end

return builtin
