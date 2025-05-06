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
|$\color{#6495EE}{● \\#6495EE}$|$\color{#437AED}{● \\#437AED}$|function-like names|
|$\color{#A78CFA}{● \\#A78CFA}$|$\color{#7C4DFF}{● \\#7C4DFF}$|declaration keywords|
|$\color{#E4BF7F}{● \\#E4BF7F}$|$\color{#F0AA0B}{● \\#F0AA0B}$|parameter name and typeparameter|
|$\color{#FF6AB3}{● \\#FF6AB3}$|$\color{#EF8ED8}{● \\#EF8ED8}$|primitive/builtin type names|
|$\color{#56B7C3}{● \\#56B7C3}$|$\color{#00BEC4}{● \\#00BEC4}$|type names, arithmetic operators|
|$\color{#98C379}{● \\#98C379}$|$\color{#53A053}{● \\#53A053}$|string context|
|$\color{#B0B7C3}{● \\#B0B7C3}$|$\color{#5D5D5F}{● \\#5D5D5F}$|variable|
|$\color{#FF9070}{● \\#FF9070}$|$\color{#FF6D12}{● \\#FF6D12}$|numbers, constants|
|$\color{#CF68E1}{● \\#CF68E1}$|$\color{#C838C6}{● \\#C838C6}$|flow control keywords, boolean literal, null literal,keyword operators|
|$\color{#E06C75}{● \\#E06C75}$|$\color{#CD6069}{● \\#CD6069}$|object members/properties, namespaces/modules|
|$\color{#676E95}{● \\#676E95}$|$\color{#A9A9AA}{● \\#A9A9AA}$|comment|
|$\color{#F02B77}{● \\#F02B77}$|$\color{#FA278E}{● \\#FA278E}$|builtin variables like `self`, `super`, `this`, `base`|

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

> [!CAUTION]
> All highlight groups uses certain overrided color will be affected,
> something unexpected might happen. To override more specificly, use [override_highlight](#override-highlight).

> [!TIP]
> For palette structure, see: [palette.lua](https://github.com/sharpchen/Eva-Theme.nvim/blob/master/lua/Eva-Theme/palette.lua)
> Or use [lazydev.nvim](https://github.com/folke/lazydev.nvim) to get full intellisense from type annotations.

```lua
require('Eva-Theme').setup({
  override_palette = {
    dark = {
      background = '#14161B',
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
`Palette` and variant name is available for the function case.

```lua
require('Eva-Theme').setup({
  override_highlight = {
    --#region for each variant
    dark = {
      ['@foo'] = { fg = '#RRGGBB', bg = '#RRGGBB' },
    },
    light = {
      ['@foo'] = { fg = '#RRGGBB', bg = '#RRGGBB' },
    },
    --#endregion

    --#region using callbacks can be more flexible
    ['@foo'] = function(variant, _)
      return { fg = require('Eva-Theme.utils').is_dark(variant) and '#RRGGBB' or '#RRGGBB' }
    end,
    LspInlayHint = function(_, palette)
      return { fg = palette.comment, bg = false }
    end
    --#endregion
  },
})
```

> [!tip]
> Value returned from `override_highlight` will be merged with the default value. Set certain property to `false` or empty string to cancel the default.

> [!NOTE]
> `Palette` accessible here is the palette override by `override_palette`.

### Ambiguity issue

This port was intended to respect the [upstream](https://github.com/fisheva/Eva-Theme) where operators got different colors by their usages.
While treesitter parsers generally don't classify operator into different usages, so there's no much I can do.
If you find ambiguity between operator and type(pointer type `T*` for example), I suggest customize by yourself.

This is what I prefer:

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
