return {
  'saghen/blink.cmp',
  version = '*', -- or a specific release/tag
  build = 'cargo build --release', -- required for Rust modules
  dependencies = {
    'rafamadriz/friendly-snippets', -- for snippets support
    -- add other dependencies as needed
    'giuxtaposition/blink-cmp-copilot', -- for Copilot support
  },
  event = 'InsertEnter', -- lazy-load on insert
  opts = {
    -- configuration options (see below)
    lsp = {},
    path = {},
    buffer = {},
    luasnip = {},
    copilot = {},
  },
  providers = {
    copilot = {
      name = 'copilot',
      module = 'blink-cmp-copilot',
      kind = 'Copilot',
      async = true,
      opts = {
        max_completions = 3,
        debounce = 750,
      },
    },
  },
}
