return {
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' }, -- Only loads for Java files
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'java' },
        callback = function()
          local jdtls_bin = vim.fn.stdpath 'data' .. '/mason/bin/jdtls'
          local root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
          require('jdtls').start_or_attach {
            cmd = { jdtls_bin },
            root_dir = root_dir,
            -- add further configuration here, such as on_attach and capabilities if desired
          }
        end,
      })
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim', -- Ensures LSP servers can be installed via Mason
    },
  },
}
