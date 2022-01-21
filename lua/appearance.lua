local function colorcolumns ()
  local colorcolumns = {}
  for i=1, 250 do
    table.insert(colorcolumns, tostring(i))
  end

  return "+" .. table.concat(colorcolumns, ",+")
end

local function setup()
  vim.api.nvim_command('colorscheme gruvbox')
  vim.api.nvim_command('set cursorline')
  vim.wo.colorcolumn = colorcolumns()
  vim.highlight.link('LineNr', 'ColorColumn', {force = true})
  vim.highlight.link('CursorLine', 'ColorColumn', {force = true})
end

return {
  setup = setup
}
