local M = {}
---@param variant Palette | string
function M.is_bold(variant)
  if type(variant) == 'string' then
    return (variant:find('bold') ~= nil and not variant:find('italic'))
  end
  return (variant.name:find('bold') ~= nil and not variant.name:find('italic'))
end

---@param variant Palette | string
function M.is_italic(variant)
  if type(variant) == 'string' then
    return (variant:find('italic') ~= nil and not variant:find('bold'))
  end
  return (variant.name:find('italic') ~= nil and not variant.name:find('bold'))
end

---@param variant Palette | string
function M.is_italicbold(variant)
  if type(variant) == 'string' then
    return (variant:find('italic') ~= nil and variant:find('bold') ~= nil)
  end
  return (variant.name:find('italic') ~= nil and variant.name:find('bold') ~= nil)
end

---@param variant Palette | string
function M.is_normal(variant)
  if type(variant) == 'string' then
    return (variant:find('bold') == nil and variant:find('italic') == nil)
  end
  return (not variant.name:find('bold') and not variant.name:find('italic'))
end

---@param variant Palette | string
function M.is_dark(variant)
  if type(variant) == 'string' then
    return (variant:find('dark') ~= nil)
  end
  return (variant.name:find('dark') ~= nil)
end

---@param variant Palette | string
function M.is_light(variant)
  if type(variant) == 'string' then
    return (variant:find('light') ~= nil)
  end
  return (variant.name:find('light') ~= nil)
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
