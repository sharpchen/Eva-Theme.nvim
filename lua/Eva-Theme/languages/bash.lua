---@param s Eva-Theme.HighlightSource
local function bash(s)
  s:map_token('func', { '@function.builtin.bash', '@punctuation.special.bash' })
    :map_token('property', '@variable.builtin.bash')
    :map_token('text', '@variable.parameter.bash')
end

return bash
