return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  { -- comments
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    -- enabled = vim.fn.has("nvim-0.10.0") == 1,
    -- config = function()
    --   vim.keymap.set({ "n", "v" }, "<C-l>", "gcc", { desc = "Comment a line of code", remap = true })
    -- end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },

  -- git diff things c:
  { "akinsho/git-conflict.nvim", version = "*", opts = {} },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = nil,
      },
    },
  },
}
