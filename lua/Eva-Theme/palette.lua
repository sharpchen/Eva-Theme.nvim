local M = {}

---@class Eva-Theme.GitPalette
---@field stagedModified? string
---@field stagedDeleted? string
---@field renamed? string
---@field ignored? string
---@field stagedAdded? string
---@field diffModified? string
---@field diffDeleted? string
---@field diffAdded? string
---@field untracked? string

---@class Eva-Theme.Palette
---@field name? string
---@field panelBackground? string
---@field typeparam? string
---@field comment? string
---@field type? string
---@field instanceReference? string
---@field parameter? string
---@field logical? string
---@field variable? string
---@field operator? string
---@field property? string
---@field primitive? string
---@field digit? string
---@field func? string
---@field declarative? string
---@field text? string
---@field git? Eva-Theme.GitPalette
---@field inlay_hint? { fg: string, bg: string }
---@field escape? string
---@field punctuation? string
---@field background? string

---@type Eva-Theme.Palette
M.light_base = {
  declarative = '#7C4DFF',
  func = '#437AED',
  type = '#00BEC4',
  instanceReference = '#FA278E',
  primitive = '#EF8ED8',
  digit = '#FF6D12',
  parameter = '#F0AA0B',
  typeparam = '#F0AA0B',
  text = '#53A053',
  logical = '#C838C6',
  operator = '#00BEC4',
  property = '#CD6069',
  comment = '#A9A9AA',
  variable = '#5D5D5F',
  background = '#EBEEF5',
  panelBackground = '#e1e4eb',
  warning = '#FB942F',
  error = '#E45454',
  info = '#4480F4',
  git = {
    diffAdded = '#40AD41',
    diffDeleted = '#F14C4C',
    diffModified = '#9277E6',
    stagedAdded = '#83C654',
    ignored = '#A9A9AA',
    renamed = '#F3AD01',
    stagedDeleted = '#CD6069',
    stagedModified = '#D73BD5',
    untracked = '#3EC141',
    bg = {
      diffDeleted = '#ECD9DF',
      diffAdded = '#CAE5D2',
      diffWordDeleted = '#edbdc1',
      diffWordAdded = '#9cd8a1',
    },
  },
  inlay_hint = {
    fg = '#888888',
    bg = '#e5e8ee',
  },
  escape = '#888888',
  punctuation = '#727376',
}
---@type Eva-Theme.Palette
M.dark_base = {
  inlay_hint = {
    fg = '#8A97C3',
    bg = '#343744',
  },
  git = {
    added = '#98C379',
    ignored = '#676E95',
    renamed = '#E4BF7F',
    stagedDeleted = '#E06C75',
    stagedModified = '#D365E5',
    untracked = '#3EC141',
    diffAdded = '#40AD41',
    diffDeleted = '#F14C4C',
    diffModified = '#A78CFA',
    bg = {
      diffDeleted = '#503239',
      diffAdded = '#2c3c37',
      diffWordDeleted = '#813a3f',
      diffWordAdded = '#33573c',
      diffModified = '#4EC15019',
      diffWordModified = '#4EC15033',
    },
  },
  warning = '#EF973A',
  error = '#F36464',
  info = '#598DEF',
  panelBackground = '#21252b',
  declarative = '#A78CFA',
  func = '#6495EE',
  type = '#56B7C3',
  instanceReference = '#F02B77',
  primitive = '#FF6AB3',
  digit = '#FF9070',
  parameter = '#E4BF7F',
  typeparam = '#E4BF7F',
  text = '#98C379',
  property = '#E06C75',
  logical = '#CF68E1',
  comment = '#676E95',
  operator = '#56B7C3',
  variable = '#B0B7C3',
  background = '#282C34',
  escape = '#8A97C3',
  punctuation = '#838FA7',
}

M.user_light = vim.deepcopy(M.light_base)
M.user_dark = vim.deepcopy(M.dark_base)

---dynamically create a palette overridden by user
---@param variant Eva-Theme.ThemeName
---@return Eva-Theme.Palette
function M:from_variant(variant)
  return vim.tbl_extend('force', variant:find('light') ~= nil and self.user_light or self.user_dark, { name = variant })
end

return M
