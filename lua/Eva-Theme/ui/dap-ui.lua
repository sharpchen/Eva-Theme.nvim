---@type StaticImporter
local function dap_ui(h)
  h:map_token('type', 'DapUIType')
    :map_token('func', { 'DapUIDecoration', 'DapUIScope', 'DapUIStoppedThread' })
    :map_token('text', { 'DapUIValue', 'DapUILineNumber', 'DapUIBreakpointsPath' })
    :map_token('NONE', 'DapUIModifiedValue', function(p, _)
      return { fg = p.git.diffModified }
    end)
    :map_token('logical', { 'DapUIWatchesValue', 'DapUICurrentFrameName' })
    :map_token('parameter', 'DapUIBreakpointsCurrentLine')
end

return dap_ui
