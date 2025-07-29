return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'jdtls', 'pyright', 'rust_analyzer', 'ts_ls' }, -- list any language servers you want auto-installed
    },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },
  },
}
