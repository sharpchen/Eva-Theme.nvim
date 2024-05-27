# Eva-Theme.nvim

A semantic coloring code colorscheme for [NeoVim](https://github.com/neovim/neovim) ported from [Eva-Theme](https://github.com/fisheva/Eva-Theme)

Supports both Dark and Light modes, with four styles available for each mode: Normal, Bold, Italic, and Italic Bold.

|||
|---|---|
|///|///|

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

### Switch colorscheme

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
