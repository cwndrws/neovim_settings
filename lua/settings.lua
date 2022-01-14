vim.api.nvim_command('colorscheme gruvbox')
vim.o.number = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.mouse = "a"
vim.g.ale_fixers = {'remove_trailing_lines', 'trim_whitespace'}
vim.g.ale_fix_on_save = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.deoplete.enable_at_startup = 1
