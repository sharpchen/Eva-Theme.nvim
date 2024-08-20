# Eva-Theme.nvim

A semantic coloring code colorscheme for [NeoVim](https://github.com/neovim/neovim) ported from [Eva-Theme](https://github.com/fisheva/Eva-Theme)

Supports both Dark and Light modes, with four styles available for each mode: Normal, Bold, Italic, and Italic Bold.

## 🌙 Dark

![Snipaste_2024-08-14_20-20-16](https://github.com/user-attachments/assets/fdbc1cea-f07f-4488-a139-3e2032996e00)

## ☀ Light

![Snipaste_2024-08-14_17-42-18](https://github.com/user-attachments/assets/a744944e-8089-4636-806a-d4fdddb602ef)

## 🛠 Installation

### [Lazy](https://github.com/folke/lazy.nvim)
```lua
{
  'sharpchen/Eva-Theme.nvim',
  lazy = false,
  priority = 1000,
}
```

## 🎯 Usage

### VimScript

```vim
colo Eva-Dark " or any other variant
" colo Eva-Light
" colo Eva-Dark-Bold
" colo Eva-Light-Bold
" colo Eva-Dark-Italic
" colo Eva-Light-Italic
" colo Eva-Dark-Italic-Bold
" colo Eva-Light-Italic-Bold
```

### Lua

```lua
vim.cmd('colo Eva-Dark') -- or any variant
```

## ⚙ Options

### Override palette

Specifiy colors for dark and light variants, specified values will be taken while the rest remains default.

**All highlight groups uses certain overrided color will be affected, something unexpected might happen. To override more specificly, use `override_highlight`**

> For palette structure, see: [palette.lua](https://github.com/sharpchen/Eva-Theme.nvim/blob/master/lua/Eva-Theme/palette.lua)

```lua
require('Eva-Theme').setup({
  override_palette = {
    dark = {
      operator = '#RRGGBB'
      git = {
        diffAdded = '#RRGGBB'
      }
    },
    light = {
      declarative = '#RRGGBB'
    }
  }
})
```

### Override highlight

To customize any highlight group for different variants, you can put function callbacks or tables of key-value pair inside `override_highlight`.

```lua
require('Eva-Theme').setup({
  override_highlight = {
    dark = {
      ['@foo'] = { fg = '#RRGGBB', bg = '#RRGGBB' },
    },
    light = {
      ['@foo'] = { fg = '#RRGGBB', bg = '#RRGGBB' },
    },
    ['@foo'] = function(variant)
      return { fg = require('Eva-Theme.utils').is_dark(variant) and '#RRGGBB' or '#RRGGBB' }
    end,
  },
})
```

### Ambiguity issue

This port was intented to respect the [upstream](https://github.com/fisheva/Eva-Theme) where operators got different colors by their usages.
While treesitter parsers generally don't classify operator into different usages, so there's no much I can do.
If you find ambiguity between operator and type(pointer type `T*` for example), I suggest customize by yourself.

This is what I prefer:

```lua
require('Eva-Theme').setup({
  override_palette = {
    dark = {
      operator = require('Eva-Theme.palette').dark_base.logical,
    },
    light = {
      operator = require('Eva-Theme.palette').light_base.logical,
    },
  },
)
```

## Contributing

See: [CONTRIBUTING.md](./CONTRIBUTING.md) 
