local FileType = require('filetypes.filetype')
local lua = FileType:new{
    extensions = {"lua"},
    commands = {
        "echom 'hello'",
        function() print("goodbye") end,
    }
}
return lua
