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
--- | 'background'
--- | 'panelBackground'
--- | 'typeparam'
---@alias Eva-Theme.ThemeName 'light' | 'light_bold' | 'light_italic' | 'light_italic_bold' | 'dark' | 'dark_bold' | 'dark_italic' | 'dark_italic_bold'
---@alias Eva-Theme.Selector fun(palette: Eva-Theme.Palette, as: Eva-Theme.SyntaxType): vim.api.keyset.highlight
---@alias Eva-Theme.Import fun(self, h: Eva-Theme.StaticImporter): Eva-Theme.HighlightRegistrationWithFunction
---@alias Eva-Theme.StaticImporter fun(h: Eva-Theme.HighlightRegistrationWithFunction)
---@alias Eva-Theme.MapProc fun(self, syntax: Eva-Theme.SyntaxType, group: string | string[], selector?: Eva-Theme.Selector): Eva-Theme.HighlightRegistrationWithFunction
---@alias Eva-Theme.HighlightCreator fun(self, palette: Eva-Theme.Palette): table<string, vim.api.keyset.highlight>
---@alias Eva-Theme.HighlightRegistrationWithFunction { map_token: Eva-Theme.MapProc, map_ui: Eva-Theme.MapProc, with: Eva-Theme.Import, highlight_groups: Eva-Theme.HighlightCreator }
