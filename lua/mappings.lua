local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Setup leader
map('n', '<Space>', '')
vim.g.mapleader = ' '

-- <Leader><direction> -- move to the window to the <direction>
map('n', '<Leader>h', '<C-w>h')
map('n', '<Leader>j', '<C-w>j')
map('n', '<Leader>k', '<C-w>k')
map('n', '<Leader>l', '<C-w>l')

-- <Leader>w -- other window commands
map('n', '<Leader>w', '<C-w>')

-- <Leader><Leader>o -- open last buffer
map('n', '<Leader><Leader>o', '<C-^>')

-- <Leader>e -- Edit file, starting in the same directory as current file.
map('n', '<Leader>e', ":edit <C-R>=expand('%:p:h') . '/'<CR>")

-- <Leader>s -- Open split and start editing file, starting in the same directory as current file
map('n', '<Leader>s', ":split <C-R>=expand('%:p:h') . '/'<CR>")

-- <Leader>v -- Open vertical split and start editing file, starting in the same directory as current file
map('n', '<Leader>v', ":vsplit <C-R>=expand('%:p:h') . '/'<CR>")
