---@class Options
---@field override_palette? { ['dark' | 'light']: Palette }
---@field override_highlight? { dark: table<string, vim.api.keyset.highlight>, light: table<string, vim.api.keyset.highlight>, [string]: fun(v: ThemeName): vim.api.keyset.highlight }

local M = {}
---@type Options
M.option = {}

local palette = require('Eva-Theme.palette')

function M:override_palette()
  if self.option.override_palette == nil then
    return
  end
  palette.user_dark = vim.tbl_deep_extend('force', palette.user_dark, self.option.override_palette.dark or {})
  palette.user_light = vim.tbl_deep_extend('force', palette.user_light, self.option.override_palette.light or {})
end

---@param p Palette
---@return { [string]: vim.api.keyset.highlight }
function M:user_highlights(p)
  if self.option.override_highlight == nil or next(self.option.override_highlight) == nil then
    return {}
  end
  local variant = p.name
  ---@type table<string, vim.api.keyset.highlight>
  local user_highlights = {}
  for group_or_variant, func_or_pair in pairs(self.option.override_highlight) do
    if type(func_or_pair) == 'function' then
      user_highlights[group_or_variant] = vim.tbl_extend(
        'keep',
        func_or_pair(variant),
        require('Eva-Theme.selector_handler'):handle(p, group_or_variant)(p, 'NONE')
      )
    end
    if group_or_variant == variant then
      local pair = func_or_pair --[[@as table<string, vim.api.keyset.highlight>]]
      for group, style in pairs(pair) do
        user_highlights[group] =
          vim.tbl_extend('keep', style, require('Eva-Theme.selector_handler'):handle(p, group)(p, 'NONE'))
      end
    end
  end
  return user_highlights
end

function M.emit_user_config()
  if next(M.option) == nil then
    return
  end
  M:override_palette()
end

return M
