---@type StaticImporter
local function markdown(h)
  h:map_token('text', 'markdownUrl'):map_token('NONE', '@markup.italic', function(_, _)
    return { italic = true, fg = '#C57BDB' }
  end)
end

return markdown
