---@type StaticImporter
local function lsp(h)
    h:map('parameter', { '@lsp.type.parameter', '@lsp.type.typeParameter' })
        :map('property', '@lsp.type.property')
    -- :map('digit', { '@lsp.typemod.variable.readonly' })
end

return lsp
