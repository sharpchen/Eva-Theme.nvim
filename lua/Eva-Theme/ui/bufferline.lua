---@type StaticImporter
local function bufferline(h)
    h:map('background', 'BufferLineBufferSelected', function(palette, as)
        return { bg = palette[as], fg = palette['variable'] }
    end)
        :map('panelBackground', 'BufferLineBackground', function(palette, as)
            return { bg = palette[as] }
        end)
        :map('variable', 'BufferLineCloseButton', function(palette, as)
            return { bg = palette[as], fg = palette['background'] }
        end)
end

return bufferline
