---@type StaticImporter
local function rust(h)
    h:map_token('logical', '@lsp.typemod.keyword.controlFlow.rust')
end

return rust
