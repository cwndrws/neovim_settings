local function colorcolumns ()
  local colorcolumns = {}
  for i=1, 250 do
    table.insert(colorcolumns, tostring(i))
  end

  return "+" .. table.concat(colorcolumns, ",+")
end

local function on_focus ()
  vim.wo.winhighlight = ''
  vim.cmd('ownsyntax on')
end

local function on_blur ()
  local winhighlight_blurred = table.concat({
    'CursorLineNr:LineNr',
    'EndOfBuffer:ColorColumn',
    'IncSearch:ColorColumn',
    'Normal:ColorColumn',
    'NormalNC:ColorColumn',
    'Search:ColorColumn',
    'SignColumn:ColorColumn'
  }, ',')

  vim.wo.winhighlight = winhighlight_blurred
  vim.cmd('ownsyntax off')
end

local function setup()
  vim.api.nvim_command('colorscheme gruvbox')
  vim.api.nvim_command('set cursorline')
  vim.wo.colorcolumn = colorcolumns()
  vim.highlight.link('LineNr', 'ColorColumn', {force = true})
  vim.highlight.link('CursorLine', 'ColorColumn', {force = true})
  autocmd = require('autocmd')
  autocmd.augroup {
    group = 'on_focus_commands',
    autocmds = {
      {event = 'FocusGained', pattern = '*', cmd = on_focus},
      {event = 'BufEnter', pattern = '*', cmd = on_focus},
      {event = 'VimEnter', pattern = '*', cmd = on_focus},
      {event = 'WinEnter', pattern = '*', cmd = on_focus},
    }
  }

  autocmd.augroup {
    group = 'on_blur_commands',
    autocmds = {
      {event = 'FocusLost', pattern = '*', cmd = on_blur},
      {event = 'BufLeave', pattern = '*', cmd = on_blur},
      {event = 'WinLeave', pattern = '*', cmd = on_blur},
    }
  }
end

return {
  setup = setup
}
