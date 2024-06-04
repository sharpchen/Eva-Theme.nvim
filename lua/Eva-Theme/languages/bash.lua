---@type StaticImporter
local function bash(h)
    h:map_token('func', 'function.builtin.bash')
end

return bash
