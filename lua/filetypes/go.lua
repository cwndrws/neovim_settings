local FileType = require('filetypes.filetype')
local go = FileType:new{
  extensions = {"go"},
  commands = {
    "let b:ale_linters = ['golangci-lint', 'gopls']",
    "let b:ale_fixers = ['gofmt', 'goimports']",
    "let b:ale_go_golangci_lint_options = ' --fast'",
    "let b:ale_go_langserver_executable = 'gopls'",
  }
}
return go
