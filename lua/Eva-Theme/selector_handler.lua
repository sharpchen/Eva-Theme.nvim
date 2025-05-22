---@class Eva-Theme.SelectorHandler
---@field handle fun(self, palette: Eva-Theme.Palette | string, group: string): Eva-Theme.Selector
---@field should_handle fun(palette: Eva-Theme.Palette | string): boolean
---@field get_selector Eva-Theme.SelectorPicker
---@field next Eva-Theme.SelectorHandler
---@field chain fun(self: Eva-Theme.SelectorHandler, next: Eva-Theme.SelectorHandler): Eva-Theme.SelectorHandler

---@alias Eva-Theme.SelectorPicker fun(group: string): Eva-Theme.Selector
local utils = require('Eva-Theme.utils')
local shouldbe_bold = require('Eva-Theme.shouldbe_bold')
local shouldnotbe_italic = require('Eva-Theme.shouldnotbe_italic')
---@type Eva-Theme.Selector
local normal_selector = function(palette, as)
  return { fg = palette[as], nocombine = true }
end
---@type Eva-Theme.Selector
local bold_selector = function(palette, as)
  return { fg = palette[as], bold = true, nocombine = true }
end

---@type Eva-Theme.Selector
local italic_selector = function(palette, as)
  return { fg = palette[as], italic = true, nocombine = true }
end

---@type Eva-Theme.Selector
local italic_bold_selector = function(palette, as)
  return { fg = palette[as], bold = true, italic = true, nocombine = true }
end

-- TODO: maybe I should make some time to use metatable to do inheritance
---@type Eva-Theme.SelectorHandler
local handler_base = {}

function handler_base:chain(next)
  self.next = next
  return next
end

---@param palette Eva-Theme.Palette | string
---@param group string
---@return Eva-Theme.Selector
function handler_base:handle(palette, group)
  return self.should_handle(palette) and self.get_selector(group) or self.next:handle(palette, group)
end

---@type Eva-Theme.SelectorHandler
local normal_handler = vim.tbl_extend('keep', handler_base, {
  ---@param palette Eva-Theme.Palette | string
  should_handle = function(palette)
    return utils.is_normal(palette)
  end,
  ---@type Eva-Theme.SelectorPicker
  get_selector = function(_)
    return normal_selector
  end,
})

local bold_handler = vim.tbl_extend('keep', handler_base, {
  ---@param palette Eva-Theme.Palette | string
  should_handle = function(palette)
    return utils.is_bold(palette)
  end,
  ---@type Eva-Theme.SelectorPicker
  get_selector = function(group)
    return vim.list_contains(shouldbe_bold, group) and bold_selector or normal_selector
  end,
})

local italic_handler = vim.tbl_extend('keep', handler_base, {
  ---@param palette Eva-Theme.Palette | string
  should_handle = function(palette)
    return utils.is_italic(palette)
  end,
  ---@type Eva-Theme.SelectorPicker
  get_selector = function(group)
    return not vim.list_contains(shouldnotbe_italic, group) and italic_selector or normal_selector
  end,
})

local italic_bold_handler = vim.tbl_extend('keep', handler_base, {
  ---@param palette Eva-Theme.Palette | string
  should_handle = function(palette)
    return utils.is_italicbold(palette)
  end,
  ---@type Eva-Theme.SelectorPicker
  get_selector = function(group)
    local be_bold = vim.list_contains(shouldbe_bold, group)
    local be_italic = not vim.list_contains(shouldnotbe_italic, group)
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

normal_handler:chain(bold_handler):chain(italic_handler):chain(italic_bold_handler)

return normal_handler
