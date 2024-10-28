---@type StaticImporter
local function vim(h)
  h:map_token('property', '@variable.builtin.vim')
end

return vim
