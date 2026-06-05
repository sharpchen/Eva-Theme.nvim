local utils = require('Eva-Theme.utils')
---@param s Eva-Theme.HighlightSource
local function render_markdown(s)
  s:map_ui('panelBackground', 'RenderMarkdownCode', function(palette, as)
    return { bg = palette[as] }
  end):map_ui('NONE', 'RenderMarkdownCodeInline', function(p, _)
    return { fg = p.text, bg = utils.is_dark(p) and '#495949' or '#bed7c5' }
  end)
end
return render_markdown
