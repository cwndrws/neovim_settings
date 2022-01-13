local function setup()
    require('settings')
    require('mappings')
    require('nvim-web-devicons').setup({
        default = true;
    })
    require('nvim-tree').setup()
end

return {
    setup = setup
}
