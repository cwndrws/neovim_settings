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


  -- --column: Show column number
  -- --line-number: Show line number
  -- --no-heading: Do not show file headings in results
  -- --fixed-strings: Search term as a literal string
  -- --ignore-case: Case insensitive search
  -- --no-ignore: Do not respect .gitignore, etc...
  -- --hidden: Search hidden files and folders
  -- --follow: Follow symlinks
  -- --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  -- --color: Search color options
  vim.api.nvim_command('command! -bang -nargs=* Find call fzf#vim#grep(\'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" \'.shellescape(<q-args>), 1, <bang>0)')

  -- <Leader>F -- ripgrep live fuzzy search with fzf
  nmap('<Leader>F', ':Find <CR>')

  -- <Leader>* -- ripgrep fzf search for word under cursor
  nmap('<Leader>*', ':Find <C-R>=expand(\'<cword>\')<CR><CR>')

  -- Some Git Binds
  nmap('<Leader>gs', ':Git <CR>')
  nmap('<Leader>gb', ':Git blame <CR>')
  nmap('<Leader>gl', ':Git log <CR>')

  -- <Leader>T -- Run the nearest test to the cursor
  nmap('<Leader>T', ':TestNearest <CR>')

  -- <Leader>t -- Run the last test we ran
  nmap('<Leader>t', ':TestLast <CR>')

  -- <Leader><Leader>d -- preview definition
  nmap('<silent> <Leader><Leader>d', ':Lspsaga preview_definition<CR>')

  -- <Leader><Leader>h -- hover card
  nmap('<silent> <Leader><Leader>h', ':Lspsaga hover_doc<CR>')

  -- <Leader><Leader>e -- next error
  nmap('<slient> <Leader><Leader>e', ':Lspsaga diagnostic_jump_next<CR>')

  -- <Leader><Leader>E -- previous error
  nmap('<silent> <Leader><Leader>E', ':Lspsaga diagnostic_jump_prev<CR>')

  -- Avoid unintentional switches to Ex mode
  nmap ('Q', '<nop>')

  -- Somehow, setting some of these mappings is wiping out existing mappings for
  -- vim-easymotion. This sets them back.
  vim.api.nvim_set_keymap('', '<Leader><Leader>', '<Plug>(easymotion-prefix)', {})
end

return {
  setup = setup
}
