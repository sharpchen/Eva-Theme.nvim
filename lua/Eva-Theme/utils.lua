local M = {}
---@param palette Palette
function M.isBold(palette)
  return palette.name:find('bold') ~= nil and not palette.name:find('italic')
end

---@param palette Palette
function M.isItalic(palette)
  return palette.name:find('italic') ~= nil and not palette.name:find('bold')
end

---@param palette Palette
function M.isItalicBold(palette)
  return palette.name:find('italic') ~= nil and palette.name:find('bold') ~= nil
end

---@param palette Palette
function M.isNormal(palette)
  return not palette.name:find('bold') and not palette.name:find('italic')
end

---@param palette Palette
function M.isDark(palette)
  return palette.name:find('dark') ~= nil
end

---@param palette Palette
function M.isLight(palette)
  return palette.name:find('light') ~= nil
end

function M.lighten(color, percent)
  -- Validate input color format
  local r, g, b = color:match('#(%x%x)(%x%x)(%x%x)')
  if not (r and g and b) then
    return color
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
  return string.format('#%02x%02x%02x', r, g, b)
end

function M.darken(color, percent)
  -- Validate input color format
  local r, g, b = color:match('#(%x%x)(%x%x)(%x%x)')
  if not (r and g and b) then
    return color
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
  return string.format('#%02x%02x%02x', r, g, b)
end

return M
