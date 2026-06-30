local M = {}
local U = require('Eva-Theme.utils')
local C = require('Eva-Theme.config')

---@param variant Eva-Theme.ThemeName
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

---@param variant? Eva-Theme.ThemeName
function M.colorscheme(variant)
  variant = variant or 'dark'

  vim.opt.termguicolors = true
  vim.o.background = U.is_dark(variant) and 'dark' or 'light'

  vim.cmd('set cursorline')

  vim.cmd('hi clear')
  vim.cmd('syntax reset')

  vim.g.colors_name = variant_name(variant)

  local P = require('Eva-Theme.palette')
  local H = require('Eva-Theme.highlight')

  local palette = P:from_variant(variant)

  for hl_name, hl in H:iter_hl(palette) do
    vim.api.nvim_set_hl(0, hl_name, hl)
  end

  -- TODO: generate as whole table on CI
  -- and compile user config

  -- override with user highlights
  for hl_name, uhl in pairs(C:eval_user_hl(palette)) do
    local builtin_hl = vim.api.nvim_get_hl(0, { name = hl_name, link = false, create = false })
    local merged_hl = vim.tbl_extend('force', builtin_hl, uhl)
    vim.api.nvim_set_hl(0, hl_name, merged_hl)
  end

  set_termcolors(vim.o.background)
end

---@param opts Eva-Theme.Config
function M.setup(opts)
  C.config = vim.tbl_deep_extend('force', C.config, opts)
  C:apply_palette_override()
end

return M
