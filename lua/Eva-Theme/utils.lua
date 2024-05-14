function Highlight()

end

---@param palette Palette
function IsBold(palette)
    return palette.name:find('bold') and true or false
end

---@param palette Palette
function IsItalic(palette)
    return palette.name:find('italic') and true or false
end
