# Eva-Theme.nvim

A semantic coloring code colorscheme for [NeoVim](https://github.com/neovim/neovim) ported from [Eva-Theme](https://github.com/fisheva/Eva-Theme)

Supports both Dark and Light modes, with four styles available for each mode: Normal, Bold, Italic, and Italic Bold.

## Dark

![dark](https://github.com/sharpchen/Eva-Theme.nvim/assets/77432836/440069c2-a817-43e4-aae8-be29a91663d2)

## Light

![light](https://github.com/sharpchen/Eva-Theme.nvim/assets/77432836/d39f8459-c2b1-4aac-88ad-a607e4413b4d)

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
