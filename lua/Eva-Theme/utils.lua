local M = {
  isDark = nil,
}
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
  if M.isDark ~= nil then
    return M.isDark
  end
  if type(variant) == 'string' then
    return (variant:find('dark') ~= nil)
  end
  return (variant.name:find('dark') ~= nil)
end

---@param variant Palette | string
function M.is_light(variant)
  return not M.is_dark(variant)
end

function M.lighten(color, percentage)
  local h, s, l = M.HEXtoHSL(color)
  local r, g, b = M.HSLtoRGB(h, s, l * (1 + percentage / 100))
  return string.format('#%02x%02x%02x', r, g, b)
end

function M.darken(color, percentage)
  local h, s, l = M.HEXtoHSL(color)
  local r, g, b = M.HSLtoRGB(h, s, l * (1 - percentage / 100))
  return string.format('#%02x%02x%02x', r, g, b)
end
---converts #RRGGBB to HSL
---@param hex string
---@return integer
---@return number
---@return number
function M.HEXtoHSL(hex)
  local r, g, b = hex:match('#(%x%x)(%x%x)(%x%x)')
  if not (r and g and b) then
    error('invalid rgb format: ' .. hex)
  end
  -- clamp to 0-1
  r, g, b = tonumber(r, 16) / 255, tonumber(g, 16) / 255, tonumber(b, 16) / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local delta = max - min
  local l = (min + max) / 2
  local h, s
  if delta == 0 then
    h, s = 0, 0
  else
    s = l <= 0.5 and (delta / (max + min)) or (delta / (2 - max - min))
    local hue
    if r == max then
      hue = (g - b) / 6 / delta
    elseif g == max then
      hue = 1 / 3 + (b - r) / 6 / delta
    else
      hue = 2 / 3 + (r - g) / 6 / delta
    end
    if hue < 0 then
      hue = hue + 1
    end
    if hue > 1 then
      hue = hue - 1
    end
    h = (hue * 360)
  end
  return h, s, l
end
---@param h number
---@param s number
---@param l number
---@return integer
---@return integer
---@return integer
function M.HSLtoRGB(h, s, l)
  ---@param v1 number
  ---@param v2 number
  ---@param vH number
  ---@return number
  local function hue2rgb(v1, v2, vH)
    if vH < 0 then
      vH = vH + 1
    end
    if vH > 1 then
      vH = vH - 1
    end
    if 6 * vH < 1 then
      return (v1 + (v2 - v1) * 6 * vH)
    end
    if 2 * vH < 1 then
      return v2
    end
    if 3 * vH < 2 then
      return (v1 + (v2 - v1) * ((2.0 / 3) - vH) * 6)
    end
    return v1
  end
  local r, g, b
  if s == 0 then
    local t = math.floor(l * 255)
    r, g, b = t, t, t
  else
    local v1, v2
    local hue = h / 360
    v2 = l < 0.5 and l * (1 + s) or (l + s) - l * s
    v1 = 2 * l - v2
    r = math.floor(255 * hue2rgb(v1, v2, hue + 1 / 3) + 0.5)
    g = math.floor(255 * hue2rgb(v1, v2, hue) + 0.5)
    b = math.floor(255 * hue2rgb(v1, v2, hue - 1 / 3) + 0.5)
  end
  return r, g, b
end

return M
