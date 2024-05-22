---@type StaticImporter
local function markdown(h)
    h:map_token('text', 'markdownUrl')
end

return markdown
