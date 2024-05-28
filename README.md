# Eva-Theme.nvim

A semantic coloring code colorscheme for [NeoVim](https://github.com/neovim/neovim) ported from [Eva-Theme](https://github.com/fisheva/Eva-Theme)

Supports both Dark and Light modes, with four styles available for each mode: Normal, Bold, Italic, and Italic Bold.

## Dark

![dark1](https://github.com/sharpchen/Eva-Theme.nvim/assets/77432836/66c72a69-146d-4232-b72f-4559916c7c20)


## Light

![light2](https://github.com/sharpchen/Eva-Theme.nvim/assets/77432836/77e98199-78fe-4725-8c9b-389a9ee0d8b2)


## 🛠 Installation

### [Lazy](https://github.com/folke/lazy.nvim)

```lua
{
  "sharpchen/Eva-Theme.nvim",
  lazy = false,
  priority = 1000,
}
```

## 🎯 Setup

### Select Variants

- VimScript

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

- Lua

```lua
vim.cmd('colo Eva-Dark') -- or any variant
```

### Options

Currently no option is opened. If you need any, please create a feature request.

## Contribution Guide
