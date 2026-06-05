local U = require('Eva-Theme.utils')
local shouldbe_bold = require('Eva-Theme.shouldbe_bold')
local shouldnotbe_italic = require('Eva-Theme.shouldnotbe_italic')

---@alias Eva-Theme.Selector (fun(p: Eva-Theme.Palette, kind: Eva-Theme.SyntaxType): vim.api.keyset.highlight)

---@type Eva-Theme.Selector
local function normal_selector(palette, kind)
  return { fg = palette[kind], nocombine = true }
end
---@type Eva-Theme.Selector
local function bold_selector(palette, kind)
  return { fg = palette[kind], bold = true, nocombine = true }
end

---@type Eva-Theme.Selector
local function italic_selector(palette, kind)
  return { fg = palette[kind], italic = true, nocombine = true }
end

---@type Eva-Theme.Selector
local function italic_bold_selector(palette, kind)
  return { fg = palette[kind], bold = true, italic = true, nocombine = true }
end

---@class Eva-Theme.SelectorHandler
---@field handle fun(self, palette: Eva-Theme.Palette | Eva-Theme.ThemeName, hl_name: string): Eva-Theme.Selector
---@field should_handle fun(palette: Eva-Theme.Palette | Eva-Theme.ThemeName): boolean
---@field get_selector fun(hl_name: string): Eva-Theme.Selector
---@field next Eva-Theme.SelectorHandler
---@field chain fun(self: Eva-Theme.SelectorHandler, next: Eva-Theme.SelectorHandler): Eva-Theme.SelectorHandler
local Handler = {}

function Handler:new(o)
  o = o or {}
  self.__index = self
  return setmetatable(o, self)
end

function Handler:chain(next)
  self.next = next
  return next
end

---@param palette Eva-Theme.Palette | Eva-Theme.ThemeName
---@param hl_name string
---@return Eva-Theme.Selector
function Handler:handle(palette, hl_name)
  return self.should_handle(palette) and self.get_selector(hl_name) or self.next:handle(palette, hl_name)
end

---@type Eva-Theme.SelectorHandler
local NormalHandler = Handler:new({
  ---@param palette Eva-Theme.Palette | Eva-Theme.ThemeName
  should_handle = function(palette)
    return U.is_normal(palette)
  end,
  get_selector = function(_)
    return normal_selector
  end,
})

local BoldHandler = Handler:new({
  ---@param palette Eva-Theme.Palette | Eva-Theme.ThemeName
  should_handle = function(palette)
    return U.is_bold_only(palette)
  end,
  get_selector = function(hl_name)
    return vim.list_contains(shouldbe_bold, hl_name) and bold_selector or normal_selector
  end,
})

local ItalicHandler = Handler:new({
  ---@param palette Eva-Theme.Palette | Eva-Theme.ThemeName
  should_handle = function(palette)
    return U.is_italic_only(palette)
  end,
  get_selector = function(hl_name)
    return not vim.list_contains(shouldnotbe_italic, hl_name) and italic_selector or normal_selector
  end,
})

local ItalicBoldHandler = Handler:new({
  ---@param palette Eva-Theme.Palette | Eva-Theme.ThemeName
  should_handle = function(palette)
    return U.is_italicbold(palette)
  end,
  get_selector = function(hl_name)
    local be_bold = vim.list_contains(shouldbe_bold, hl_name)
    local be_italic = not vim.list_contains(shouldnotbe_italic, hl_name)
    local be_italic_bold = be_bold and be_italic
    if be_italic_bold then
      return italic_bold_selector
    elseif be_italic then
      return italic_selector
    elseif be_bold then
      return bold_selector
    else
      return normal_selector
    end
  end,
})

NormalHandler:chain(BoldHandler):chain(ItalicHandler):chain(ItalicBoldHandler)

return NormalHandler
