---@param s Eva-Theme.HighlightSource
local function rainbow(s)
  s:map_ui('digit', 'RainbowDelimiterRed')
    :map_ui('logical', 'RainbowDelimiterYellow')
    :map_ui('func', 'RainbowDelimiterBlue')
    :map_ui('digit', 'RainbowDelimiterOrange')
    :map_ui('logical', 'RainbowDelimiterGreen')
    :map_ui('func', 'RainbowDelimiterViolet')
    :map_ui('logical', 'RainbowDelimiterCyan')
end

return rainbow
