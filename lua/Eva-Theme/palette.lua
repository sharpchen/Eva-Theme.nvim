---@alias Palette { text: string, declarative: string, func: string, digit: string, primitive: string, property: string, operator: string, variable: string, logical: string, parameter: string, instanceReference: string, type: string, comment: string }
---@alias Theme { name?: string, palette: Palette }
---@alias TokenStyle { foreground: string, background: string, fontStyle: 'italic' | 'bold' | 'normal' }

---@type Theme
local light = {
    palette = {
        declarative = '#7C4DFF',
        func = '#437AED',
        type = '#00BEC4',
        instanceReference = '#FA278E',
        primitive = '#EF8ED8',
        digit = '#FF6D12',
        parameter = '#F0AA0B',
        text = '#53A053',
        logical = '#C838C6',
        operator = '#00BEC4',
        property = '#CD6069',
        comment = '#A9A9AA',
        variable = '#5D5D5F'
    }
}

---@type Theme
local dark = {
    palette = {
        declarative = '#A78CFA',
        func = '#6495EE',
        type = '#56B7C3',
        instanceReference = '#F02B77',
        primitive = '#FF6AB3',
        digit = '#FF9070',
        parameter = '#E4BF7F',
        text = '#98C379',
        property = '#E06C75',
        logical = '#CF68E1',
        comment = '#676E95',
        operator = '#56B7C3',
        variable = '#B0B7C3'
    }
}
