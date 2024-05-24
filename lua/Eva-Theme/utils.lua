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

function Lighten(color, percent)
    -- Validate input color format
    local r, g, b = color:match("#(%x%x)(%x%x)(%x%x)")
    if not (r and g and b) then
        return nil
    end
    -- Convert hexadecimal values to decimal
    r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
    -- Calculate lightening amount for each color component
    local amount = 255 * (percent / 100)
    -- Apply lightening amount to each color component
    r = math.min(math.floor(r + amount), 255)
    g = math.min(math.floor(g + amount), 255)
    b = math.min(math.floor(b + amount), 255)
    -- Convert back to hexadecimal and format the color string
    return string.format("#%02x%02x%02x", r, g, b)
end

function Darken(color, percent)
    -- Validate input color format
    local r, g, b = color:match("#(%x%x)(%x%x)(%x%x)")
    if not (r and g and b) then
        return nil
    end
    -- Convert hexadecimal values to decimal
    r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
    -- Calculate lightening amount for each color component
    local amount = 255 * (percent / 100)
    -- Apply lightening amount to each color component
    r = math.min(math.floor(r - amount), 255)
    g = math.min(math.floor(g - amount), 255)
    b = math.min(math.floor(b - amount), 255)
    -- Convert back to hexadecimal and format the color string
    return string.format("#%02x%02x%02x", r, g, b)
end
