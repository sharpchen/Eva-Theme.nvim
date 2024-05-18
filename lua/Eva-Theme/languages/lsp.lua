---@type StaticImporter
local function lsp(h)
    h:map('parameter', { '@lsp.type.parameter', '@lsp.type.typeParameter' })
        :map('property', '@lsp.type.property')
end

return lsp
