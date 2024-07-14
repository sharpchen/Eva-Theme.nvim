---@type StaticImporter
local function telescope(h)
  h:map_ui('panelBackground', 'TelescopeNormal', function(palette, as)
    return { bg = palette[as] }
  end)
    :map_ui('NONE', 'TelescopeTitle', function(palette, _)
      return { fg = palette.panelBackground, bg = palette.func }
    end)
    :map_ui('text', 'TelescopePreviewTitle', function(palette, as)
      return { bg = palette[as], fg = palette.panelBackground }
    end)
    :map_ui('declarative', 'TelescopeResultsTitle', function(palette, as)
      return { fg = palette.panelBackground, bg = palette[as] }
    end)
    :map_ui('func', 'TelescopePromptTitle', function(palette, as)
      return { fg = palette.panelBackground, bg = palette[as] }
    end)
end

return telescope
