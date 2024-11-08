local function setup_servers ()
  local lspconfig = require('lspconfig')
  lspconfig.rust_analyzer.setup{}
  lspconfig.rnix.setup{}
  lspconfig.solargraph.setup{cmd={"./bin/solargraph"}}
  lspconfig.lua_ls.setup(require("neodev").setup())
  lspconfig.gopls.setup{}
  lspconfig.ts_ls.setup{}
  local omnisharp_bin = vim.env.HOME .. "/OmniSharp"
  local pid = vim.fn.getpid()
  lspconfig.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    root_dir = lspconfig.util.root_pattern("*.sln");
  }
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
