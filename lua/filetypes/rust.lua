local FileType = require('filetypes.filetype')
local rust = FileType:new{
  extensions = {"rs"},
  commands = {
    "let b:ale_linters = ['cargo']",
    "let b:ale_fixers = ['rustfmt']",
    "let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')",
  }
}
return rust
