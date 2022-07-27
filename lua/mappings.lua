local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
    map('n', lhs, rhs, opts)
end

local function setup ()
  -- Setup leader
  nmap('<Space>', '')
  vim.g.mapleader = ' '

  -- <Leader><direction> -- move to the window to the <direction>
  nmap('<Leader>h', '<C-w>h')
  nmap('<Leader>j', '<C-w>j')
  nmap('<Leader>k', '<C-w>k')
  nmap('<Leader>l', '<C-w>l')

  -- <Leader>w -- other window commands
  nmap('<Leader>w', '<C-w>')

  -- <Leader><Leader>o -- open last buffer
  nmap('<Leader><Leader>o', '<C-^>')

  -- <Leader>e -- Edit file, starting in the same directory as current file.
  nmap('<Leader>e', ":edit <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>s -- Open split and start editing file, starting in the same directory as current file
  nmap('<Leader>s', ":split <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>v -- Open vertical split and start editing file, starting in the same directory as current file
  nmap('<Leader>v', ":vsplit <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>f -- file fuzzy finder with fzf
  nmap('<Leader>f', ':Files <CR>')

  -- <Leader>b -- fuzzy finder for open buffers
  nmap('<Leader>b', ':Buffers <CR>')

  vim.api.nvim_command('command! -bang -nargs=* Rg' ..
      ' call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,' ..
      ' fzf#vim#with_preview({\'options\': \'--delimiter : --nth 4..\'}), <bang>0)')

  -- <Leader>F -- search with ripgrep
  nmap('<Leader>F', ':Ack <C-R><CR>')

  -- <Leader>* -- search with ripgrep word under cursor
  nmap('<Leader>*', ':Ack <C-R>=expand(\'<cword>\')<CR><CR>')

  -- Some Git Binds
  nmap('<Leader>gs', ':Git <CR>')
  nmap('<Leader>gb', ':Git blame <CR>')
  nmap('<Leader>gl', ':Git log --pretty=oneline --graph<CR>')

  -- <Leader>T -- Run the nearest test to the cursor
  nmap('<Leader>T', ':TestNearest <CR>')

  -- <Leader>t -- Run the last test we ran
  nmap('<Leader>t', ':TestLast <CR>')

  -- <Leader><Leader>d -- preview definition
  nmap('<Leader><Leader>d', ':Lspsaga preview_definition<CR>')

  -- <Leader><Leader>h -- hover card
  nmap('<Leader><Leader>h', ':Lspsaga hover_doc<CR>')

  -- <Leader><Leader>e -- next error
  nmap('<Leader><Leader>e', ':Lspsaga diagnostic_jump_next<CR>')

  -- <Leader><Leader>E -- previous error
  nmap('<Leader><Leader>E', ':Lspsaga diagnostic_jump_prev<CR>')

  -- <Leader><Leader>f -- open lsp finder on current word/symbol
  nmap('<Leader><Leader>f', ':Lspsaga lsp_finder<CR>')

  -- <Leader>y -- osc yank copy to system clipboard
  nmap('<Leader>y', ':OSCYank<CR>')

  -- Avoid unintentional switches to Ex mode
  nmap ('Q', '<nop>')
end

return {
  setup = setup
}
