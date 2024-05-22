---@type StaticImporter
local function bufferline(h)
    h:map_ui('background', 'BufferLineBufferSelected', function(palette, as)
        return { bg = palette[as], fg = palette['variable'] }
    end)
        :map_ui('panelBackground', 'BufferLineBackground', function(palette, as)
            return { bg = palette[as] }
        end)
        :map_ui('variable', 'BufferLineCloseButton', function(palette, as)
            return { bg = palette[as], fg = palette['background'] }
        end)
end

return bufferline
