---@type StaticImporter
local function lsp(h)
    h:map_token('parameter', { '@lsp.type.parameter', '@lsp.type.typeParameter' })
        :map_token('property', '@lsp.type.property')
    -- :map('digit', { '@lsp.typemod.variable.readonly' })
end

return lsp
