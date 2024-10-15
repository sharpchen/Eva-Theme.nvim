---@type StaticImporter
local function render_markdown(h)
  h:map_ui('panelBackground', 'RenderMarkdownCode', function(palette, as)
    return { bg = palette[as] }
  end)
end
return render_markdown
