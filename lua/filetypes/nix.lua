local FileType = require('filetypes.filetype')
local nix = FileType:new{
  extensions = {"nix"},
  commands = {
    function ()
      require'lspconfig'.rnix.setup{}
      vim.bo.tabstop=2
      vim.bo.shiftwidth=2
    end,
  }
}
return nix
