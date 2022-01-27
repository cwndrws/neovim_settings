local FileType = require('filetypes.filetype')
local nix = FileType:new{
  extensions = {"nix"},
  commands = {
    function ()
      vim.bo.tabstop=2
      vim.bo.shiftwidth=2
    end,
  }
}
return nix
