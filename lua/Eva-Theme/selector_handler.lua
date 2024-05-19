---@alias SelectorHandler { handle: (fun(self, palette: Palette, group: string): Selector), should_handle: CanHandle, get_selector: SelectorPicker, next: SelectorHandler, chain: fun(self: SelectorHandler, next: SelectorHandler): SelectorHandler }
---@alias SelectorPicker fun(group: string): Selector
---@alias CanHandle fun(palette: Palette): boolean
require('Eva-Theme.utils')
---@type Selector
local normal_selector = function(palette, as)
    return { fg = palette[as] }
end
---@type Selector
local bold_selector = function(palette, as)
    return { fg = palette[as], bold = true }
end

---@type Selector
local italic_selector = function(palette, as)
    return { fg = palette[as], italic = true }
end

---@type Selector
local italic_bold_selector = function(palette, as)
    return { fg = palette[as], bold = true, italic = true }
end

---@type SelectorHandler
local handler_base = {}

function handler_base:chain(next)
    self.next = next
    return next
end

---@param palette Palette
---@param group string
---@return Selector
function handler_base:handle(palette, group)
    return self.should_handle(palette) and self.get_selector(group) or self.next:handle(palette, group)
end

---@type SelectorHandler
local normal_handler = table.extend(handler_base, {
    ---@param palette Palette
    should_handle = function(palette)
        return IsNormal(palette)
    end,
    ---@type SelectorPicker
    get_selector = function(_)
        return normal_selector
    end,
})


local bold_handler = table.extend(handler_base, {
    ---@param palette Palette
    should_handle = function(palette)
        return IsBold(palette)
    end,
    ---@type SelectorPicker
    get_selector = function(group)
        local _ = {}
        return table.contains(_, group) and bold_selector or normal_selector
    end,
})

local italic_handler = table.extend(handler_base, {
    ---@param palette Palette
    should_handle = function(palette)
        return IsItalic(palette)
    end,
    ---@type SelectorPicker
    get_selector = function(group)
        local _ = {}
        return table.contains(_, group) and italic_selector or normal_selector
    end,
})

local italic_bold_handler = table.extend(handler_base, {
    ---@param palette Palette
    should_handle = function(palette)
        return IsItalicBold(palette)
    end,
    ---@type SelectorPicker
    get_selector = function(group)
        local _ = {}
        return table.contains(_, group) and italic_bold_selector or normal_selector
    end,
})

normal_handler:chain(bold_handler):chain(italic_handler):chain(italic_bold_handler)

return normal_handler
