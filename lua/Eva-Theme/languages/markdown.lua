---@type StaticImporter
local function markdown(h)
    h:map('text', 'markdownUrl')
end

return markdown
