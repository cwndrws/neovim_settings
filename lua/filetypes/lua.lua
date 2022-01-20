local FileType = require('filetypes.filetype')
local lua = FileType:new{
    extensions = {"lua"},
    commands = {
        "let b:ale_fixers = ['lua-format']",
        function ()
          vim.bo.tabstop=2
          vim.bo.shiftwidth=2
        end,
    }
}
return lua
