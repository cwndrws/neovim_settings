local function setup ()
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
  vim.g.ale_fixers = {['*'] = {'remove_trailing_lines', 'trim_whitespace'}}
  vim.g.ale_fix_on_save = 1
  vim.g.ale_completion_enabled = 1
  vim.g["test#strategy"] = "vimux"
  vim.api.nvim_command('set textwidth=80')
  vim.g["EasyMotion_do_mapping"] = false
  vim.g["airline#extensions#tabline#enabled"] = 1
end

return {
  setup = setup
}
