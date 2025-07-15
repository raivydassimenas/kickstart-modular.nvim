return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  opts = {
    ensure_installed = { 'jdtls', 'lus_ls', 'pyright', 'tsserver' },
    automatic_installation = true,
  },
}
