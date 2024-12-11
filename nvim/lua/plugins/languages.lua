return {
  -- haskell
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- Rust stuffs
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    enabled = false
  },

  -- to fix diagnostics log c:
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },
}
