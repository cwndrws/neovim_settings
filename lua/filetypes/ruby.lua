local FileType = require('filetypes.filetype')
local ruby = FileType:new{
  extensions = {"rb", "erb"},
  commands = {
    "let b:ale_fixers = ['rubocop']",
    function ()
      vim.bo.tabstop=2
      vim.bo.shiftwidth=2
      require'lspconfig'.solargraph.setup{}
    end,
  }
}
return ruby
