---@alias UserHightlightHandler fun(v: ThemeName, p?: Palette): vim.api.keyset.highlight

---@class Options
---@field override_palette? { ['dark' | 'light']: Palette }
---@field override_highlight? { [string]: UserHightlightHandler, [ThemeName]: { [string]: vim.api.keyset.highlight } }

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

---@param palette Palette
---@param builtin_highlights { [string]: vim.api.keyset.highlight }
---@return { [string]: vim.api.keyset.highlight }
function M:user_highlights(palette, builtin_highlights)
  if self.option.override_highlight == nil or next(self.option.override_highlight) == nil then
    return {}
  end

  local variant = palette.name
  ---@type table<string, vim.api.keyset.highlight>
  local user_highlights = {}

  for group, func_or_pair in pairs(self.option.override_highlight) do
    local builtin_style = builtin_highlights[group] or {}

    if type(func_or_pair) == 'function' then
      local custom_style = func_or_pair(variant, palette)
      local merged = vim.tbl_extend('keep', custom_style, builtin_style)
      for key, val in pairs(merged) do
        if val == false or val == '' then
          merged[key] = nil
        end
      end
      user_highlights[group] = merged
    end

    if group == variant then
      local pair = func_or_pair --[[@as table<string, vim.api.keyset.highlight>]]
      local builtin_style = builtin_highlights[group] or {}
      for group, style in pairs(pair) do
        user_highlights[group] = vim.tbl_extend('keep', style, builtin_style)
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
