---@param palette Palette
function IsBold(palette)
    return palette.name:find('bold') and true or false
end

---@param palette Palette
function IsItalic(palette)
    return palette.name:find('italic') and true or false
end

---@param this table
---@param other table
table.union = function(this, other)
    for key, value in pairs(other) do
        if not this[key] then
            this[key] = value
        end
    end
    return this
end
