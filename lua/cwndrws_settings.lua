local function setup()
    require('settings').setup()
    require('lsp').setup()
    require('completion').setup()
    require('appearance').setup()
    require('mappings').setup()
    require('filetypes').setup()
    require('clipboard').setup()
end

return {
    setup = setup
}
