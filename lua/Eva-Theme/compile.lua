local state = vim.fn.stdpath('state')
local M = {
  cache_folder = vim.fs.joinpath(type(state) == 'string' and state or state[1], 'Eva-Theme'),
}
local _option_cache = vim.fs.joinpath(M.cache_folder, '_eva_config_cache.lua')
local _colo_cache = vim.fs.joinpath(M.cache_folder, '_eva_colo_cache.lua')
local _registration = require('Eva-Theme.highlight_registration')
---builtin highlights for variants
local _builtin_highlights = {}

if vim.fn.isdirectory(M.cache_folder) == 0 then
  vim.fn.mkdir(M.cache_folder, 'p')
end

---@type Eva-Theme.ThemeName[]
local themes = {
  'dark',
  'light',
  'dark_bold',
  'light_bold',
  'dark_italic',
  'light_italic',
  'dark_italic_bold',
  'light_italic_bold',
}

---telling whether needs recompile
---@return boolean
M.needs_compile = function()
  if vim.fn.filereadable(_option_cache) == 0 then
    return true
  end
  local f = loadfile(_option_cache)
  local option_prev
  if f then
    option_prev = f()--[[@as Options]]
  end
  local current_option = {
    user_highlights = {},
    override_palette = require('Eva-Theme.options').option.override_palette,
  }
  for _, variant in ipairs(themes) do
    local palette = require('Eva-Theme.palette'):from_variant(variant)

    if not _builtin_highlights[variant] then
      _builtin_highlights[variant] = _registration:highlight_groups(palette)
    end

    current_option.user_highlights[variant] =
      require('Eva-Theme.options'):user_highlights(palette, _builtin_highlights[variant])
  end

  return not vim.deep_equal(current_option, option_prev)
end

---compile cache of user config
---non literal values like functions in override_palette would be evaluated at build
M.option = function()
  local cache = {
    user_highlights = {},
    override_palette = require('Eva-Theme.options').option.override_palette,
  }

  -- eval all highlight override from override_highlights
  for _, variant in ipairs(themes) do
    local palette = require('Eva-Theme.palette'):from_variant(variant)

    -- get current builtin_highlights for variant
    -- it's ok that we don't resolve for other variants
    if not _builtin_highlights[variant] then
      _builtin_highlights[variant] = _registration:highlight_groups(palette)
    end

    cache.user_highlights[variant] = require('Eva-Theme.options'):user_highlights(palette, _builtin_highlights[variant])
  end

  local f, err = io.open(_option_cache, 'w')
  if f then
    f:write('-- generated at ' .. os.date('%Y-%m-%d %H:%M:%S') .. '\n')
    f:write('return ' .. vim.inspect(cache))
    f:close()
  else
    vim.notify(err --[[@as string]], vim.log.levels.ERROR or 4)
  end
  vim.notify('User config compiled.', vim.log.levels.INFO or 2, { title = 'Eva-Theme' })
end

---compile all variants into a table stores in a lua file
M.colo = function()
  local new_colo_cache = {}

  for _, variant in pairs(themes) do
    local palette = require('Eva-Theme.palette'):from_variant(variant)

    if not _builtin_highlights[variant] then
      _builtin_highlights[variant] = _registration:highlight_groups(palette)
    end

    local merged_highlights = vim.tbl_extend(
      'force',
      _builtin_highlights[variant],
      require('Eva-Theme.options'):user_highlights(palette, _builtin_highlights[variant])
    )

    new_colo_cache[variant] = merged_highlights
  end

  local f, err = io.open(_colo_cache, 'w')
  if f then
    f:write('-- generated at ' .. os.date('%Y-%m-%d %H:%M:%S') .. '\n')
    f:write('return ' .. vim.inspect(new_colo_cache))
    f:close()
  else
    vim.notify(err --[[@as string]], vim.log.levels.ERROR or 4)
  end

  vim.notify('Highlights compiled.', vim.log.levels.INFO or 2, { title = 'Eva-Theme' })
end

---returns highlights of a variant
---@param variant Eva-Theme.ThemeName
---@return table
M.colo_cache = function(variant)
  local f = loadfile(_colo_cache)
  if f then
    return f()[variant]
  else
    vim.notify('colorscheme cache not found', vim.log.levels.ERROR or 4, { title = 'Eva-Theme' })
    return {}
  end
end

return M
