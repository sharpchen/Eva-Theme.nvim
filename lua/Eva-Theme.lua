-- Entry file of the theme

local M = {}

M.colorscheme = function()
    if vim.g.colors_name then
        vim.cmd('hi clear')
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = 'Eva-Theme'
    for group, style in pairs(t) do
        vim.api.nvim_set_hl(0, group, style)
    end
end


return M
