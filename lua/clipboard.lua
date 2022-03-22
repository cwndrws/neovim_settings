local function setup ()
  vim.api.nvim_command("let g:clipboard = {" ..
                       " 'name': 'osc52'," ..
                       " 'copy': {'+': {lines, regtype -> OSCYankString(join(lines, '\n'))}}," ..
                       " 'paste': {'+': {-> [split(getreg(''), '\n'), getregtype('')]}}," ..
                       "}")
end

return {
  setup = setup
}
