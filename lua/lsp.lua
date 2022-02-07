local function setup_servers ()
  local lspconfig = require('lspconfig')
  lspconfig.rust_analyzer.setup{}
  lspconfig.rnix.setup{}
  lspconfig.solargraph.setup{}
  lspconfig.sumneko_lua.setup(require("lua-dev").setup())
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

