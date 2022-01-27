local function setup_servers ()
  require'lspconfig'.rls.setup{}
  require'lspconfig'.rnix.setup{}
  require'lspconfig'.solargraph.setup{}
end

local function setup_lspsaga ()
  local saga = require 'lspsaga'
  saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
  }
end

local function setup ()
  setup_servers()
  setup_lspsaga()
end

return {
  setup = setup
}

