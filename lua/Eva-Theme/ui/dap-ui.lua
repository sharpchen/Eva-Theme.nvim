local utils = require('Eva-Theme.utils')
---@type Eva-Theme.StaticImporter
local function dap_ui(h)
  h:map_ui(
    'type',
    { 'DapUIType', 'DapUIStepOverNC', 'DapUIStepIntoNC', 'DapUIStepOutNC', 'DapUIStepBackNC' },
    function(p, as)
      return { fg = p[as], bg = p.background, bold = true }
    end
  )
    :map_ui('func', { 'DapUIDecoration', 'DapUIScope', 'DapUIStoppedThread' })
    :map_ui('text', { 'DapUIValue', 'DapUILineNumber', 'DapUIBreakpointsPath' })
    :map_ui('NONE', 'DapUIModifiedValue', function(p, _)
      return { fg = p.git.diffModified }
    end)
    :map_ui('logical', { 'DapUIWatchesValue', 'DapUICurrentFrameName' })
    :map_ui('parameter', 'DapUIBreakpointsCurrentLine')
    :map_ui('error', 'DapUIStopNC')
    :map_ui('text', { 'DapUIRestartNC', 'DapUIPlayPause' })
    :map_ui('warning', 'debugPC', function(p, as)
      return { bg = utils.is_dark(p) and '#463D3A' or '#E7DBD4' }
    end)
end

return dap_ui
