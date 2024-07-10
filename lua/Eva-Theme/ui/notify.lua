---@type StaticImporter
local function notify(h)
  h:map_ui('info', { 'NotifyINFOTitle', 'NotifyINFOIcon', 'NotifyINFOBorder' })
    :map_ui('warning', { 'NotifyWARNIcon', 'NotifyWARNTitle', 'NotifyWARNBorder' })
end

return notify
