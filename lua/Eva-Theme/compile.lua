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

---@type ThemeName[]
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
  local cache
  if f then
    cache = f()--[[@as Options]]
  end
  local current = {
    user_highlights = {},
  }

  for _, variant in ipairs(themes) do
    local palette = require('Eva-Theme.palette'):from_variant(variant)

    if not _builtin_highlights[variant] then
      _builtin_highlights[variant] = _registration:highlight_groups(palette)
    end

    local current_user_highlights = require('Eva-Theme.options'):user_highlights(palette, _builtin_highlights[variant])
    current.user_highlights[palette.name] = current_user_highlights
  end

  current.user_palette = require('Eva-Theme.options').option.override_palette

  return not vim.deep_equal(current, cache)
end

---compile cache of user config
---non literal values like functions in override_palette would be evaluated at build
M.option = function()
  vim.notify('Eva-Theme: Compiling user config...')

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

    local current_user_highlights = require('Eva-Theme.options'):user_highlights(palette, _builtin_highlights[variant])

    cache.user_highlights[variant] = current_user_highlights
  end

  local f, err = io.open(_option_cache, 'w')
  if f then
    f:write('return ' .. vim.inspect(cache))
    f:close()
  else
    vim.notify(err --[[@as string]], vim.log.levels.ERROR)
  end
  vim.notify('Eva-Theme: User config compiled.')
end

---compile all variants into a table stores in a lua file
M.colo = function()
  vim.notify('Eva-Theme: Compiling highlights...')

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
    f:write('return ' .. vim.inspect(new_colo_cache))
    f:close()
  else
    vim.notify(err --[[@as string]], vim.log.levels.ERROR)
  end

  vim.notify('Eva-Theme: Highlights compiled.')
end

---returns highlights of a variant
---@param variant ThemeName
---@return table
M.colo_cache = function(variant)
  local f = loadfile(_colo_cache)
  if f then
    return f()[variant]
  else
    vim.notify('Eva-Theme: colorscheme cache not found', vim.log.levels.ERROR)
    return {}
  end
end

return M
