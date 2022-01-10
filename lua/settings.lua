vim.api.nvim_command('colorscheme gruvbox')
vim.o.number = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.g.ale_fixers = {'remove_trailing_lines', 'trim_whitespace'}
vim.g.ale_fix_on_save = 1