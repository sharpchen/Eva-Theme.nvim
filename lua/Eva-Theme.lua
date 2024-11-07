-- Entry file of the theme
local utils = require('Eva-Theme.utils')
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
  vim.o.background = utils.is_dark(variant) and 'dark' or 'light'
  vim.cmd('set cursorline')
  if vim.g.colors_name then
    vim.cmd('hi clear')
    vim.cmd('syntax reset')
  end

  vim.g.colors_name = variant_name(variant)
  require('Eva-Theme.options').emit_user_config()

  local compile = require('Eva-Theme.compile')
  if compile.needs_compile() then
    compile.option()
    compile.colo()
  end

  for group, style in pairs(compile.colo_cache(variant)) do
    vim.api.nvim_set_hl(0, group, style)
  end

  local dark = require('Eva-Theme.palette'):from_variant('dark')
  vim.g.terminal_color_0 = dark.background -- black
  vim.g.terminal_color_1 = dark.property -- red
  vim.g.terminal_color_2 = dark.text -- green
  vim.g.terminal_color_3 = dark.parameter -- yellow
  vim.g.terminal_color_4 = dark.func -- blue
  vim.g.terminal_color_5 = dark.logical -- magenta
  vim.g.terminal_color_6 = dark.operator -- cyan
  vim.g.terminal_color_7 = dark.variable -- white

  local light = require('Eva-Theme.palette'):from_variant('light')
  vim.g.terminal_color_8 = light.variable -- bright black
  vim.g.terminal_color_9 = light.property -- bright red
  vim.g.terminal_color_10 = light.text -- bright green
  vim.g.terminal_color_11 = light.parameter -- bright yellow
  vim.g.terminal_color_12 = light.func -- bright blue
  vim.g.terminal_color_13 = light.logical -- bright magenta
  vim.g.terminal_color_14 = light.operator -- bright cyan
  vim.g.terminal_color_15 = light.background -- bright white
end

---@param option Options
M.setup = function(option)
  require('Eva-Theme.options').option = vim.tbl_deep_extend('force', require('Eva-Theme.options').option, option)
end

vim.api.nvim_create_user_command('EvaCompile', function()
  require('Eva-Theme.compile').option()
  require('Eva-Theme.compile').colo()
end, { desc = 'compiles highlight cache for Eva-Theme' })

return M
