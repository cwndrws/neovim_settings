local FileType = require('filetypes.filetype')
local typescript = FileType:new{
  extensions = {"ts"},
  commands = {
    "let b:ale_fixers = ['prettier']",
    function ()
      vim.bo.tabstop=2
      vim.bo.shiftwidth=2
    end,
  }
}
return typescript
