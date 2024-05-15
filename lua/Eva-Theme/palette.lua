---@param this table
---@param other table
function table.union(this, other)
    for key, value in pairs(other) do
        if not this[key] then
            this[key] = value
        end
    end
    return this
end

---@type Palette
local light_base = {
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
    variable = '#5D5D5F',
    background = '#EBEEF5',
    panelBackground = '#e1e4eb'
}
---@type Palette
local dark_base = {
    panelBackground = '#21252b',
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
    variable = '#B0B7C3',
    background = '#282C34',
}

---@type Theme
local Theme = {
    ---@type Palette
    light = table.union(light_base, { name = 'light' }),
    ---@type Palette
    light_bold = table.union(light_base, { name = 'light_bold' }),
    ---@type Palette
    light_italic = table.union(light_base, { name = 'light_italic' }),
    ---@type Palette
    light_italic_bold = table.union(light_base, { name = 'light_italic_bold' }),
    ---@type Palette
    dark = table.union(dark_base, { name = 'dark' }),
    ---@type Palette
    dark_bold = table.union(dark_base, { name = 'dark_bold' }),
    ---@type Palette
    dark_italic = table.union(dark_base, { name = 'dark_italic' }),
    ---@type Palette
    dark_italic_bold = table.union(dark_base, { name = 'dark_italic_bold' })
}
return Theme
