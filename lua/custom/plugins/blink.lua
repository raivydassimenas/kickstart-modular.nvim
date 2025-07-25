return {
  -- blink.cmp: Fast, modern completion engine
  {
    'Saghen/blink.cmp',
    version = '1.*', -- Pin to stable 1.x
    event = 'InsertEnter', -- Loads only when needed
    build = 'cargo build --release', -- Requires Rust for native matcher
    dependencies = {
      'rafamadriz/friendly-snippets', -- Snippet completions
      'zbirenbaum/copilot.lua', -- Copilot AI integration
      {
        'giuxtaposition/blink-cmp-copilot', -- Enables Copilot as a blink.cmp source
        lazy = true,
      },
    },
    opts = {
      sources = {
        -- Enable Copilot in the completion menu
        default = { 'copilot', 'lsp', 'buffer', 'path', 'snippets' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100, -- adjust position in menu; try -100 to de-prioritize
            async = true,
          },
        },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = true }, -- Show ghost text as you type
        accept = { auto_brackets = { enabled = true } }, -- Automatic bracket pair completion
        toggle = '<A-;>', -- Toggle menu. Set to your preference
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      -- Add more blink.cmp settings as needed
    },
    keys = {
      {
        '<C-y>',
        function()
          require('blink.cmp').select_and_accept()
        end,
        mode = 'i',
        desc = 'Accept Blink/AI Suggestion',
      },
    },
  },

  -- Copilot: Modern AI code suggestions
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = false, -- blink.cmp handles Copilot suggestions display
        auto_trigger = true,
        keymap = {
          accept = false, -- Let blink.cmp handle accepted keys
          next = '<C-n>',
          prev = '<C-p>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false }, -- Optional: hide Copilot panel popup
      -- Configure filetypes or other Copilot options as preferred
    },
    config = function(_, opts)
      require('copilot').setup(opts)
    end,
  },
}
