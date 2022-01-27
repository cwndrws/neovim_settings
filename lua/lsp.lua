local function setup ()
  require'lspconfig'.rls.setup{}
  require'lspconfig'.rnix.setup{}
  require'lspconfig'.solargraph.setup{}
end

return {
  setup = setup
}

