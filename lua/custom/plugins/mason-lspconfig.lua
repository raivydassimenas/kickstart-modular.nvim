return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  opts = {
    'lua_ls',
    'pyright',
    'tsserver',
  },
}
