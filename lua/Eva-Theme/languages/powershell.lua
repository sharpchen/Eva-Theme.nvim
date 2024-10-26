---@type StaticImporter
local function powershell(h)
  h:map_token('func', '@function.builtin.powershell')
    :map_token('type', '@type.builtin.powershell')
    :map_token('property', '@variable.builtin.powershell')
    :map_token('logical', '@operator.powershell')
    :map_token('NONE', '@variable.parameter.builtin.powershell', function(_, _)
      return { fg = '#C57BDB' }
    end)
    :map_token('text', '@variable.parameter.powershell')
end

return powershell
