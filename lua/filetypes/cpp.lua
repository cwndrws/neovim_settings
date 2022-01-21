local FileType = require('filetypes.filetype')
local cpp = FileType:new{
  extensions = {"cpp", "cxx", "cc"},
  commands = {
    "let b:ale_linters = ['clangd']",
    "let b:ale_cpp_clangd_executable = 'clangd-9'",
  }
}
return cpp
