local function colorcolumns ()
  local columns = {}
  for i=1, 250 do
    table.insert(columns, tostring(i))
  end
  return "+" .. table.concat(columns, ",+")
end

local function disallow_blur_filetypes ()
  return {
    ['sagahover'] = true,
    ['diff'] = true,
    ['fugitiveblame']= true,
  }
end

local function on_focus ()
  local ft = vim.bo.filetype
  if ft ~= '' and disallow_blur_filetypes()[ft] ~= true then
    vim.wo.winhighlight = ''
    vim.cmd('ownsyntax on')
    vim.wo.relativenumber = true
  end
end

local function on_blur ()
  local ft = vim.bo.filetype
  if ft ~= '' and disallow_blur_filetypes()[ft] ~= true then
    local winhighlight_blurred = table.concat({
      'LineNr:StatusLineNC',
      'CursorLineNr:StatusLineNC',
      'EndOfBuffer:StatusLineNC',
      'IncSearch:StatusLineNC',
      'Normal:StatusLineNC',
      'NormalNC:StatusLineNC',
      'Search:StatusLineNC',
      'SignColumn:StatusLineNC',
      'ColorColumn:StatusLineNC',
      'CursorLine:StatusLineNC',
    }, ',')

    vim.wo.winhighlight = winhighlight_blurred
    vim.cmd('ownsyntax off')
    vim.wo.relativenumber = false
  end
end

local function setup()
  vim.api.nvim_command('colorscheme gruvbox')
  vim.api.nvim_command('set cursorline')
  vim.wo.colorcolumn = colorcolumns()
  vim.highlight.link('LineNr', 'ColorColumn', {force = true})
  vim.highlight.link('CursorLine', 'ColorColumn', {force = true})
  vim.highlight.link('EndOfBuffer', 'ColorColumn', {force = true})
  local autocmd = require('autocmd')
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
