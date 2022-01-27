local function setup()
    require('settings').setup()
    require('lsp').setup()
    require('completion').setup()
    require('appearance').setup()
    require('mappings').setup()
    require('filetypes').setup()
    require('nvim-tree').setup()
end

return {
    setup = setup
}
