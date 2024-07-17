-- Entry file of the theme
local registration = require('Eva-Theme.highlight_registration')
local Palette = require('Eva-Theme.palette')
---@param variant ThemeName
local function variant_name(variant)
  local function capitalize_first_letter(word)
    return word:sub(1, 1):upper() .. word:sub(2):lower()
  end
  local result = variant:gsub('(%a+)', capitalize_first_letter)
  return 'Eva-' .. result:gsub('_', '-')
end
local M = {}
---@param variant? ThemeName
M.colorscheme = function(variant)
  variant = variant or 'dark'
  vim.opt.termguicolors = true
  vim.cmd('set cursorline')
  if vim.g.colors_name then
    vim.cmd('hi clear')
    vim.cmd('syntax reset')
  end
  vim.g.colors_name = variant_name(variant)
  require('Eva-Theme.options').emit_user_config()
  local highlights = vim.tbl_extend(
    'keep',
    require('Eva-Theme.options'):user_highlights(variant),
    registration:highlight_groups(Palette:create_palette(variant))
  )
  for group, style in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, style)
  end
end

M.setup = function(option)
  require('Eva-Theme.options').option = option
end

return M
