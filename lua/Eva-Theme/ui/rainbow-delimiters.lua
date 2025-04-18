---@type StaticImporter
local function rainbow(h)
  h:map_ui('digit', 'RainbowDelimiterRed')
    :map_ui('logical', 'RainbowDelimiterYellow')
    :map_ui('func', 'RainbowDelimiterBlue')
    :map_ui('digit', 'RainbowDelimiterOrange')
    :map_ui('logical', 'RainbowDelimiterGreen')
    :map_ui('func', 'RainbowDelimiterViolet')
    :map_ui('logical', 'RainbowDelimiterCyan')
end

return rainbow
