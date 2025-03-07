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

---@param background 'dark' | 'light'
local function set_termcolors(background)
  if background == 'dark' then
    vim.g.terminal_color_0 = '#000000' -- black
    vim.g.terminal_color_1 = '#e51400' -- red
    vim.g.terminal_color_2 = '#4ec150' -- green
    vim.g.terminal_color_3 = '#e4bf7f' -- yellow
    vim.g.terminal_color_4 = '#4283f5' -- blue
    vim.g.terminal_color_5 = '#cf68e1' -- magenta
    vim.g.terminal_color_6 = '#56b7c3' -- cyan
    vim.g.terminal_color_7 = '#ffffff' -- white

    vim.g.terminal_color_8 = '#676e95' -- bright black
    vim.g.terminal_color_9 = '#f14c4c' -- bright red
    vim.g.terminal_color_10 = '#41c150' -- bright green
    vim.g.terminal_color_11 = '#ff8a4c' -- bright yellow
    vim.g.terminal_color_12 = '#6495ee' -- bright blue
    vim.g.terminal_color_13 = '#ff6ab3' -- bright magenta
    vim.g.terminal_color_14 = '#56b7c3' -- bright cyan
    vim.g.terminal_color_15 = '#8a97c3' -- bright white
  else
    vim.g.terminal_color_0 = '#fafafa' -- black
    vim.g.terminal_color_1 = '#ec0000' -- red
    vim.g.terminal_color_2 = '#44c145' -- green
    vim.g.terminal_color_3 = '#f0aa0b' -- yellow
    vim.g.terminal_color_4 = '#4480f4' -- blue
    vim.g.terminal_color_5 = '#c838c6' -- magenta
    vim.g.terminal_color_6 = '#00bec4' -- cyan
    vim.g.terminal_color_7 = '#000000' -- white

    vim.g.terminal_color_8 = '#aaadb4' -- bright black
    vim.g.terminal_color_9 = '#f14c4c' -- bright red
    vim.g.terminal_color_10 = '#44c145' -- bright green
    vim.g.terminal_color_11 = '#ff6d12' -- bright yellow
    vim.g.terminal_color_12 = '#4d91f8' -- bright blue
    vim.g.terminal_color_13 = '#ef8ed8' -- bright magenta
    vim.g.terminal_color_14 = '#00bec4' -- bright cyan
    vim.g.terminal_color_15 = '#888888' -- bright white
  end
end

local _checked_for_curr_session = false

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

  -- check only once for one session?
  if not _checked_for_curr_session then
    if compile.needs_compile() then
      compile.option()
      compile.colo()
    end
    _checked_for_curr_session = true
  end

  for group, style in pairs(compile.colo_cache(variant)) do
    vim.api.nvim_set_hl(0, group, style)
  end

  set_termcolors(vim.o.background)
end

---@param option Options
M.setup = function(option)
  require('Eva-Theme.options').option = vim.tbl_deep_extend('force', require('Eva-Theme.options').option, option)
end

vim.api.nvim_create_user_command('EvaCompile', function()
  require('Eva-Theme.compile').option()
  require('Eva-Theme.compile').colo()
  if vim.g.colors_name:find('^Eva%-') then
    vim.cmd.colorscheme(vim.g.colors_name)
  end
end, { desc = 'compiles highlight cache for Eva-Theme' })

return M
