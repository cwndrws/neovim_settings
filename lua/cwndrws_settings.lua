local function setup()
    require('settings')
    require('mappings')
    require('filetypes')
    require('nvim-tree').setup()
end

return {
    setup = setup
}
