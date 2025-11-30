# Eva-Theme.nvim

A semantic coloring code colorscheme for [NeoVim](https://github.com/neovim/neovim) ported from [Eva-Theme](https://github.com/fisheva/Eva-Theme)

Supports both Dark and Light modes, with four styles available for each mode: Normal, Bold, Italic, and Italic Bold.

## 🌙 Dark

![Snipaste_2024-08-14_20-20-16](https://github.com/user-attachments/assets/fdbc1cea-f07f-4488-a139-3e2032996e00)

## ☀ Light

![Snipaste_2024-08-14_17-42-18](https://github.com/user-attachments/assets/a744944e-8089-4636-806a-d4fdddb602ef)

## 🎨 Palette

|dark|light|semantic|
|---|---|---|
|$\color{#56B7C3}{● \\#56B7C3}$|$\color{#00BEC4}{● \\#00BEC4}$|type names, arithmetic operators|
|$\color{#98C379}{● \\#98C379}$|$\color{#53A053}{● \\#53A053}$|string context|
|$\color{#E4BF7F}{● \\#E4BF7F}$|$\color{#F0AA0B}{● \\#F0AA0B}$|parameter name and typeparameter|
|$\color{#FF9070}{● \\#FF9070}$|$\color{#FF6D12}{● \\#FF6D12}$|numbers, constants|
|$\color{#E06C75}{● \\#E06C75}$|$\color{#CD6069}{● \\#CD6069}$|object members/properties, namespaces/modules|
|$\color{#F02B77}{● \\#F02B77}$|$\color{#FA278E}{● \\#FA278E}$|builtin variables like `self`, `super`, `this`, `base`|
|$\color{#CF68E1}{● \\#CF68E1}$|$\color{#C838C6}{● \\#C838C6}$|flow control keywords, boolean literal, null literal,keyword operators|
|$\color{#A78CFA}{● \\#A78CFA}$|$\color{#7C4DFF}{● \\#7C4DFF}$|declaration keywords|
|$\color{#6495EE}{● \\#6495EE}$|$\color{#437AED}{● \\#437AED}$|function-like names|
|$\color{#B0B7C3}{● \\#B0B7C3}$|$\color{#5D5D5F}{● \\#5D5D5F}$|variable|
|$\color{#676E95}{● \\#676E95}$|$\color{#A9A9AA}{● \\#A9A9AA}$|comment|
|$\color{#FF6AB3}{● \\#FF6AB3}$|$\color{#EF8ED8}{● \\#EF8ED8}$|primitive/builtin type names|

## 🛠 Installation

> [!NOTE]
> For implementation downside, Eva-Theme.nvim uses file cache compilation to improve loading speed.
> Use `:EvaCompile` command to compile new cache if necessary.

### [Lazy](https://github.com/folke/lazy.nvim)
```lua
{
  'sharpchen/Eva-Theme.nvim',
  lazy = false,
  priority = 1000,
  build = ':EvaCompile'
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
vim.cmd.colo 'Eva-Dark' -- or any variant
```

## ⚙ Options

### Override palette

Specify colors for dark and light variants, specified values will be taken while the rest remains default.

> [!TIP]
> For palette structure, see: [palette.lua](https://github.com/sharpchen/Eva-Theme.nvim/blob/master/lua/Eva-Theme/palette.lua)
> Or use [lazydev.nvim](https://github.com/folke/lazydev.nvim) to get completions from type annotations.

```lua
require('Eva-Theme').setup({
  override_palette = {
    dark = {
      background = '#14161B',
      -- ...
    },
    light = {
      declarative = '#RRGGBB'
      -- ...
    }
  }
})
```

### Override highlight

To customize any highlight group for each variants, you can use
function callbacks `[string]: fun(variant: Eva-Theme.ThemeName, palette: Eva-Theme.Palette): vim.keyset.highlight`
  - `variant`: theme name such as `dark_bold`, `dark_italic_bold`
  - `palette`: the palette overridden after `override_palette`

```lua
require('Eva-Theme').setup({
  override_highlight = {
    --#region using callbacks can be more flexible
    ['@foo.bar.baz'] = function(variant, _)
      return { fg = variant == 'dark_bold' and '#RRGGBB' or '#RRGGBB' }
    end,
    LspInlayHint = function(_, palette)
      return { fg = palette.comment, bg = 'none' } -- use `none` to cancel the default value
    end
    --#endregion
  },
})
```

### Ambiguity issue

This port was intended to respect the [upstream](https://github.com/fisheva/Eva-Theme) where operators got different colors by their usages.
While treesitter parsers generally don't classify operator into different usages, so there's no much I can do(might be approachable by treesitter query but I've not got time to learn it).
If you find ambiguity between operator and type(pointer type `T*` for example), I suggest customize by yourself.

For example:

```lua
require('Eva-Theme').setup({
  override_palette = {
    dark = {
      operator = require('Eva-Theme.palette').dark_base.punctuation,
    },
    light = {
      operator = require('Eva-Theme.palette').light_base.punctuation,
    },
  },
)
```

## Contributing

See: [CONTRIBUTING.md](./CONTRIBUTING.md)
