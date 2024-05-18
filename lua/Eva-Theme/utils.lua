---@param palette Palette
function IsBold(palette)
    return palette.name:find('bold') ~= nil and not palette.name:find('italic')
end

---@param palette Palette
function IsItalic(palette)
    return palette.name:find('italic') ~= nil and not palette.name:find('bold')
end

---@param palette Palette
function IsItalicBold(palette)
    return palette.name:find('italic') ~= nil and palette.name:find('bold') ~= nil
end

---@param palette Palette
function IsNormal(palette)
    return not palette.name:find('bold') and not palette.name:find('italic')
end

---@param palette Palette
function IsDark(palette)
    return palette.name:find('dark') ~= nil
end

---@param palette Palette
function IsLight(palette)
    return palette.name:find('light') ~= nil
end

--- extend a table with another returning new instance
---@param this table
---@param other table
table.extend = function(this, other)
    local ret = {}
    for key, value in pairs(this) do
        ret[key] = value;
    end
    for key, value in pairs(other) do
        if not ret[key] then
            ret[key] = value
        end
    end
    return ret
end

--- merge two tables returning original instance
---@param this table
---@param other table
table.merge = function(this, other)
    for key, value in pairs(other) do
        if not this[key] then
            this[key] = value
        end
    end
    return this
end

---@generic T
---@param this table<T>
---@param target T
---@return boolean
table.contains = function(this, target)
    for _, value in pairs(this) do
        if value == target then
            return true
        end
    end
    return false
end
