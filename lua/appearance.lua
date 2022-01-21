local function setup()
  vim.api.nvim_command('colorscheme gruvbox')
  vim.wo.colorcolumn = colorcolumns()
  vim.highlight.link('LineNr', 'ColorColumn')
  vim.highlight.link('CursorLine', 'ColorColumn')
end

local function colorcolumns ()
  colorcolumns = {}
  for i=1, 250 do
    table.insert(colorcolumns, tostring(i))
  end

  return "+" .. table.concat(colorcolumns, ",+")
end

return {
  setup = setup
}
