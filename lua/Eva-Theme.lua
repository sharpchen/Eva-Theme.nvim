-- Entry file of the theme
local registration = require('Eva-Theme.highlight_registration')
local Theme = require('Eva-Theme.palette')
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
  for group, style in pairs(registration:highlight_groups(Theme[variant])) do
    vim.api.nvim_set_hl(0, group, style)
  end
end
M.setup = function(option) end

return M
