local U = require('Eva-Theme.utils')
local M = {}

---@class Eva-Theme.PaletteContext
---@field dark? Eva-Theme.Palette dark palette overridden by user
---@field light? Eva-Theme.Palette light palette overridden by user
---@field dark_base Eva-Theme.Palette original dark palette
---@field light_base Eva-Theme.Palette original light palette
---@field current? Eva-Theme.Palette overridden palette of current variant

---@class Eva-Theme.Config
---@field override_palette? table<'dark' | 'light', Partial<Eva-Theme.Palette> | fun(p: Eva-Theme.PaletteContext): Partial<Eva-Theme.Palette>>
---@field override_highlight? fun(variant: Eva-Theme.ThemeName, palettes: Eva-Theme.PaletteContext): table<string, vim.api.keyset.highlight>
M.config = {
  override_highlight = function(_, _) end,
}

function M:apply_palette_override()
  local palette = require('Eva-Theme.palette')

  if self.config.override_palette == nil then
    return
  end

  local user_dark = self.config.override_palette.dark or {}
  local user_light = self.config.override_palette.light or {}

  ---@type Eva-Theme.PaletteContext
  local palette_context = {
    dark_base = palette.dark_base,
    light_base = palette.light_base,
  }

  palette.user_dark = vim.tbl_deep_extend('force', palette.user_dark, U.fn_or_val(user_dark, palette_context) or {})
  palette.user_light = vim.tbl_deep_extend('force', palette.user_light, U.fn_or_val(user_light, palette_context) or {})
end

---@param p Eva-Theme.Palette
---@param builtin_highlights table<string, vim.api.keyset.highlight>
---@return table<string, vim.api.keyset.highlight>
function M:eval_user_hl(p)
  local palette = require('Eva-Theme.palette')

  if self.config.override_highlight == nil then
    return {}
  end

  local variant = p.name --[[@as string]]

  ---@type Eva-Theme.PaletteContext
  local palette_context = {
    current = p,
    dark = palette.user_dark,
    light = palette.user_light,
    dark_base = palette.dark_base,
    light_base = palette.light_base,
  }

  return self.config.override_highlight(variant, palette_context) or {}
end

return M
