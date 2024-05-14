-- Entry file of the theme
local scope = require('scope_match')
local Theme = require('Eva-Theme.palette')

local M = {}
---@param variant? ThemeName
M.colorscheme = function(variant)
    variant = variant or 'dark'
    vim.opt.termguicolors = true
    if vim.g.colors_name then
        vim.cmd('hi clear')
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = 'Eva-Theme'
    for group, style in pairs(scope:create_highlight_groups(Theme[variant])) do
        vim.api.nvim_set_hl(0, group, style)
    end
end
M.setup = function(option)

end

return M
