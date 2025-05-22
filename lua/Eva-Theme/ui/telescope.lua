---@type Eva-Theme.StaticImporter
local function telescope(h)
  h:map_ui('NONE', 'TelescopeNormal', function(_, _)
    return { link = 'Normal' }
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
    :map_ui('NONE', 'TelescopeBorder', function(palette, _)
      return { fg = palette.inlay_hint.fg }
    end)
end

return telescope
