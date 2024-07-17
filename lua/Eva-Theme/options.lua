---@class Options
---@field override_palette? table<ThemeName, { [string]: TokenStyle }>
---@field override_highlight? { dark: table<string, TokenStyle>, light: table<string, TokenStyle>, [string]: fun(v: ThemeName): TokenStyle }

local M = {}
---@type Options
M.option = {}

local palette = require('Eva-Theme.palette')

function M:override_palette()
  if self.option.override_palette == nil then
    return
  end
  palette.dark_base = vim.tbl_deep_extend('force', palette.dark_base, self.option.override_palette.dark or {})
  palette.light_base = vim.tbl_deep_extend('force', palette.light_base, self.option.override_palette.light or {})
end

---@param variant ThemeName
---@return { [string]: TokenStyle }
function M:user_highlights(variant)
  if self.option.override_highlight == nil or next(self.option.override_highlight) == nil then
    return {}
  end
  ---@type table<string, TokenStyle>
  local user_highlights = {}
  for key, value in pairs(self.option.override_highlight) do
    if type(value) == 'function' then
      user_highlights[key] = value(variant)
    end
    if key == variant then
      local val = value --[[@as table<string, TokenStyle>]]
      for k, v in pairs(val) do
        user_highlights[k] = v
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
