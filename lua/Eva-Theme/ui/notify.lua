---@param s Eva-Theme.HighlightSource
local function notify(s)
  s:map_ui('info', { 'NotifyINFOTitle', 'NotifyINFOIcon', 'NotifyINFOBorder' })
    :map_ui('warning', { 'NotifyWARNIcon', 'NotifyWARNTitle', 'NotifyWARNBorder' })
end

return notify
