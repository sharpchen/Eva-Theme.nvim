---@alias Eva-Theme.SyntaxType
--- | 'NONE'
--- | 'error'
--- | 'warning'
--- | 'info'
--- | 'declarative'
--- | 'text'
--- | 'func'
--- | 'property'
--- | 'primitive'
--- | 'type'
--- | 'digit'
--- | 'parameter'
--- | 'comment'
--- | 'variable'
--- | 'this'
--- | 'logical'
--- | 'operator'
--- | 'background'
--- | 'panelBackground'
--- | 'typeparam'

---@param palette Eva-Theme.Palette
---@param kind Eva-Theme.SyntaxType
---@param selector fun(p: Eva-Theme.Palette, kind: Eva-Theme.SyntaxType): vim.api.keyset.highlight
---@param hl_name string
---@return string, vim.api.keyset.highlight
local function gen_hl_from_ui_spec(palette, kind, selector, hl_name)
  local selector = selector or function(p, as)
    return { fg = p[as] }
  end
  return hl_name, selector(palette, kind)
end

---@param palette Eva-Theme.Palette
---@param kind Eva-Theme.SyntaxType
---@param selector fun(p: Eva-Theme.Palette, kind: Eva-Theme.SyntaxType): vim.api.keyset.highlight
---@param hl_name string
---@return string, vim.api.keyset.highlight
local function gen_hl_from_token_spec(palette, kind, selector, hl_name)
  local default_selector = require('Eva-Theme.selector_handler'):handle(palette, hl_name)
  return hl_name,
    vim.tbl_deep_extend('force', default_selector(palette, kind), selector and selector(palette, kind) or {})
end

---@return Eva-Theme.HighlightSource
local function create_source()
  ---@class Eva-Theme.HighlightSource
  ---@field hl_generators (fun(p: Eva-Theme.Palette): string, vim.api.keyset.highlight)[]
  local S = {
    hl_generators = {},
  }

  ---@param kind Eva-Theme.SyntaxType
  ---@param hl_names string | string[]
  ---@param selector fun(p: Eva-Theme.Palette, kind: Eva-Theme.SyntaxType): vim.api.keyset.highlight
  ---@return self
  function S:map_token(kind, hl_names, selector)
    for _, hl_name in ipairs(type(hl_names) == 'string' and { hl_names } or hl_names or {}) do
      table.insert(self.hl_generators, function(palette)
        return gen_hl_from_token_spec(palette, kind, selector, hl_name)
      end)
    end

    return self
  end

  ---@param kind Eva-Theme.SyntaxType
  ---@param hl_names string | string[]
  ---@param selector fun(p: Eva-Theme.Palette, kind: Eva-Theme.SyntaxType): vim.api.keyset.highlight
  ---@return self
  function S:map_ui(kind, hl_names, selector)
    for _, hl_name in ipairs(type(hl_names) == 'string' and { hl_names } or hl_names or {}) do
      table.insert(self.hl_generators, function(palette)
        return gen_hl_from_ui_spec(palette, kind, selector, hl_name)
      end)
    end

    return self
  end

  function S:iter(palette)
    local idx = 0
    local generators = self.hl_generators
    return function()
      idx = idx + 1
      if idx <= #generators then
        return generators[idx](palette)
      end
    end
  end

  return S
end

local function create_highlights()
  ---@class Eva-Theme.HighlightStore
  ---@field sources Eva-Theme.HighlightSource[]
  local H = {
    sources = {},
  }

  --- callbacks from sources can be reused on each :colo
  --- so we should persist this H table
  ---@return self
  function H:add_source(callback)
    local s = create_source()
    callback(s)
    table.insert(self.sources, s)

    return self
  end

  ---@param palette Eva-Theme.Palette
  ---@return fun(): string, vim.api.keyset.highlight
  function H:iter_hl(palette)
    return coroutine.wrap(function()
      for _, s in ipairs(self.sources) do
        for hl_name, hl in s:iter(palette) do
          coroutine.yield(hl_name, hl)
        end
      end
    end)
  end

  return H
end

return create_highlights()
  :add_source(require('Eva-Theme.languages.builtin'))
  :add_source(require('Eva-Theme.languages.treesitter'))
  :add_source(require('Eva-Theme.languages.lsp'))
  :add_source(require('Eva-Theme.languages.bash'))
  :add_source(require('Eva-Theme.languages.c'))
  :add_source(require('Eva-Theme.languages.csharp'))
  :add_source(require('Eva-Theme.languages.editorconfig'))
  :add_source(require('Eva-Theme.languages.fsharp'))
  :add_source(require('Eva-Theme.languages.lua'))
  :add_source(require('Eva-Theme.languages.rust'))
  :add_source(require('Eva-Theme.languages.javascript'))
  :add_source(require('Eva-Theme.languages.typescript'))
  :add_source(require('Eva-Theme.languages.markdown'))
  :add_source(require('Eva-Theme.languages.html'))
  :add_source(require('Eva-Theme.languages.css'))
  :add_source(require('Eva-Theme.languages.vue'))
  :add_source(require('Eva-Theme.languages.vim'))
  :add_source(require('Eva-Theme.languages.xml'))
  :add_source(require('Eva-Theme.languages.nix'))
  :add_source(require('Eva-Theme.languages.powershell'))
  :add_source(require('Eva-Theme.ui.builtin'))
  :add_source(require('Eva-Theme.ui.indent-blankline'))
  :add_source(require('Eva-Theme.ui.cmp'))
  :add_source(require('Eva-Theme.ui.gitsigns'))
  :add_source(require('Eva-Theme.ui.neo-tree'))
  :add_source(require('Eva-Theme.ui.vim-illuminate'))
  :add_source(require('Eva-Theme.ui.treesitter-context'))
  :add_source(require('Eva-Theme.ui.telescope'))
  :add_source(require('Eva-Theme.ui.notify'))
  :add_source(require('Eva-Theme.ui.sniprun'))
  :add_source(require('Eva-Theme.ui.render-markdown'))
  :add_source(require('Eva-Theme.ui.dap-ui'))
  :add_source(require('Eva-Theme.ui.blink_cmp'))
  :add_source(require('Eva-Theme.ui.rainbow-delimiters'))
  :add_source(require('Eva-Theme.ui.snacks'))
