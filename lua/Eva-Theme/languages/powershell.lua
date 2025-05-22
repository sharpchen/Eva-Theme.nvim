---@type Eva-Theme.StaticImporter
local function powershell(h)
  h:map_token('func', '@function.builtin.powershell')
    :map_token('primitive', '@type.builtin.powershell')
    :map_token('property', '@variable.builtin.powershell')
    :map_token('NONE', '@variable.parameter.builtin.powershell', function(_, _)
      return { fg = '#C57BDB' }
    end)
    :map_token('text', '@variable.parameter.powershell')
    :map_token('NONE', { '@lsp.type.keyword.ps1', '@lsp.type.operator.ps1' })
end

return powershell
