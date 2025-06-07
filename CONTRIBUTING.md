# Contributing to `Eva-Theme.nvim`

PRs are welcomed if there's any issue about highlighting and options. The following guide shows you how to get your PR implemented in a recommended way.
If you're contributing for a new feature, please open an issue before you push.

## Color semantics

[Eva-Theme](https://github.com/fisheva/Eva-Theme) follows the concept of *semantic highlighting*, different colors has specific semantic in context.

|dark|light|semantic|alias|
|---|---|---|---|
|$\color{#6495EE}{● \\#6495EE}$|$\color{#437AED}{● \\#437AED}$|function-like names|func|
|$\color{#A78CFA}{● \\#A78CFA}$|$\color{#7C4DFF}{● \\#7C4DFF}$|declaration keywords|declarative|
|$\color{#E4BF7F}{● \\#E4BF7F}$|$\color{#F0AA0B}{● \\#F0AA0B}$|parameter name and typeparameter|parameter|
|$\color{#FF6AB3}{● \\#FF6AB3}$|$\color{#EF8ED8}{● \\#EF8ED8}$|primitive/builtin type names|primitive|
|$\color{#56B7C3}{● \\#56B7C3}$|$\color{#00BEC4}{● \\#00BEC4}$|type names, arithmetic operators|type|
|$\color{#98C379}{● \\#98C379}$|$\color{#53A053}{● \\#53A053}$|string context|text|
|$\color{#B0B7C3}{● \\#B0B7C3}$|$\color{#5D5D5F}{● \\#5D5D5F}$|variable|variable|
|$\color{#FF9070}{● \\#FF9070}$|$\color{#FF6D12}{● \\#FF6D12}$|numbers, constants|digit|
|$\color{#CF68E1}{● \\#CF68E1}$|$\color{#C838C6}{● \\#C838C6}$|flow control keywords, boolean literal, null literal,keyword operators|logical|
|$\color{#E06C75}{● \\#E06C75}$|$\color{#CD6069}{● \\#CD6069}$|object members/properties, namespaces/modules|property|
|$\color{#676E95}{● \\#676E95}$|$\color{#A9A9AA}{● \\#A9A9AA}$|comment|comment|
|$\color{#F02B77}{● \\#F02B77}$|$\color{#FA278E}{● \\#FA278E}$|builtin variables like `self`, `super`, `this`, `base`|instanceReference|

`alias` column shows the string union members in the code base:

```lua
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
--- | 'instanceReference'
--- | 'logical'
--- | 'operator'
--- | 'typeparam'
--- | 'background' -- I know I should not include it but I already did.
--- | 'panelBackground'
```

## Fix highlightings

This code base is written in a personally prefered way to perform highlight registrations using certain patterns.
The following section introduces two separate ways to highlight tokens using the builtin designs.

### Plugin specific highlightings

If to adapt a plugin that currently not supported, please add a new lua file as `lua/Eva-Theme/ui/<plugin_name>.lua`.

- **Mapping colors from builtin palettes, this handles for all variants like light and dark.**

```lua
-- lua/Eva-Theme/ui/plugin_name.lua
---@type Eva-Theme.StaticImporter
local function plugin_name(h)
    h:map_ui('func', 'NeoTreeCursorLine') -- highlight `NeoTreeCursorLine` with the color `func` from a palette
     :map_ui('property', { 'some_group', 'other_group' }) -- can be a array that maps multiple highlight groups with a same rule
     :map_ui('NONE', 'some_group', function(palette, _)
        return {
            bg = require('Eva-Theme.utils').is_dark(palette) and 'red' or 'blue'
        }
    end)
    -- use any color to handle dark and light variants
end

return plugin_name
```

- **Default behavior of `map_ui`**

The third paramter of `map_ui` is a callback typed as `fun(palette: Palette, as: Eva-Theme.SyntaxType)` where `Eva-Theme.SyntaxType` is a member name of every palette as the table mentioned above.
The default callback is:

```lua
function(palette, as)
    return { fg = palette[as] }
end -- so it colors foreground by default using specific palette color
```

To use any color, simply overrides the callback, however, you might need to adapt for light and dark.
There's some global functions to check whether a palette is certain variants to make sure everything colors.

```lua

-- lua/Eva-Theme/ui/plugin_name.lua
---@type Eva-Theme.StaticImporter
local function plugin_name(h)
    h:map_ui('NONE', 'some_group', function(palette, as)
        return {
            bg = require('Eva-Theme.utils').is_dark(palette) and 'red' or 'blue'
        }
    end)
end

return plugin_name
```

Finally, if you're adding support for a plugin, import the registration callback in `lua/Eva-Theme/highlight_registration.lua`

```lua
-- ...
return create_highlights()
    :with(require('Eva-Theme.ui.builtin'))
    :with(require('Eva-Theme.ui.indent-blankline'))
    :with(require('Eva-Theme.ui.cmp'))
    :with(require('Eva-Theme.ui.gitsigns'))
    :with(require('Eva-Theme.ui.neo-tree'))
    :with(require('Eva-Theme.ui.vim-illuminate'))
    :with(require('Eva-Theme.ui.treesitter-context'))
    :with(require('Eva-Theme.ui.<plugin_name>')) -- import your module here
```

### Language spcific highlightings

If to adapt a language that currently not supported, please add a new lua file as `lua/Eva-Theme/ui/<language_name>.lua`.
Fixing or adding support for a language is basically the same as the `map_ui` but use `map_token` instead.

- **Default behavior of `map_token`**

The third paramter of `map_token` is a callback typed as `fun(palette: Palette, as: Eva-Theme.SyntaxType)` where `Eva-Theme.SyntaxType` is a member name of every palette as the table mentioned above.
The default callback is really dependent on the `lua/Eva-Theme/seletor_handler.lua`, but it doesn't matter. Simply add your custom style, the font style should be handelled automatically.

To use any color, simply overrides the callback, however, you might need to adapt for light and dark.
There's some global functions to check whether a palette is certain variants to make sure everything colors.

```lua
---@type Eva-Theme.StaticImporter
local function javascript(h)
    h:map_token('logical', { '@constant.builtin.javascript' })
        :map_token('func', { '@punctuation.special.javascript' }, function(p, as)
            return { fg = p[as], nocombine = true } -- `as` is 'func' here
        end)
        :map_token('declarative', '@keyword.operator.javascript')
end

return javascript
```

Finally, if you're adding support for a language, import the registration callback in `lua/Eva-Theme/highlight_registration.lua`

```lua
-- ...
return create_highlights()
    :with(require('Eva-Theme.languages.builtin'))
    :with(require('Eva-Theme.languages.treesitter'))
    :with(require('Eva-Theme.languages.lsp'))
    :with(require('Eva-Theme.languages.bash'))
    :with(require('Eva-Theme.languages.c'))
    :with(require('Eva-Theme.languages.csharp'))
    :with(require('Eva-Theme.languages.lua'))
    :with(require('Eva-Theme.languages.rust'))
    :with(require('Eva-Theme.languages.javascript'))
    :with(require('Eva-Theme.languages.typescript'))
    :with(require('Eva-Theme.languages.markdown'))
    :with(require('Eva-Theme.languages.html'))
    :with(require('Eva-Theme.languages.vue'))
    :with(require('Eva-Theme.languages.xml'))
    :with(require('Eva-Theme.languages.<language_name>')) -- your language here!
```

### Font-style handeling

- All highlight groups are *normal* by default in bold variants, to make it bold, include it in `lua/Eva-Theme/shouldbe_bold.lua`
- All highlight groups are *italic* by default in italic variants, to make it non-italic, include it in `lua/Eva-Theme/shouldnotbe_italic.lua`
- Which should be certain font style? See: [font-style-rules](https://github.com/fisheva/Eva-Theme/blob/master/documents/font-style-rules.md)
