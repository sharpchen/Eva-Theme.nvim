---@param s Eva-Theme.HighlightSource
local function markdown(s)
  s:map_token('text', 'markdownUrl'):map_token('NONE', '@markup.italic', function(_, _)
    return { italic = true, fg = '#C57BDB' }
  end)
end

return markdown
