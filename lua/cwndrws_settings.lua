local function setup()
    require('settings')
    require('mappings')
    require('nvim-tree').setup()
end

return {
    setup = setup
}
