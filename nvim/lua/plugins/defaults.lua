return {
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    },

    { -- package manager for lsp servers et all
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({})
            vim.keymap.set("n", "<leader>l", vim.cmd.Mason, { desc = "Open mason" })
        end
    },

    "nvim-tree/nvim-web-devicons", -- icons
    "folke/which-key.nvim", -- doc for shortcuts
    -- "echasnovski/mini.icons", -- more icons??

    { -- comments
      "folke/ts-comments.nvim",
      event = "VeryLazy",
      enabled = vim.fn.has("nvim-0.10.0") == 1,
      config = function()
        vim.keymap.set({"n", "v"}, "<C-l>", "gcc", { desc = "Comment a line of code", remap = true })
      end
    },

    { -- botton line
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },

    -- markdown
    -- { 'iamcco/markdown-preview.nvim' }
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = function()
        require("lazy").load({ plugins = { "markdown-preview.nvim" } })
        vim.fn["mkdp#util#install"]()
      end,
      keys = {
        {
          "<leader>cp",
          ft = "markdown",
          "<cmd>MarkdownPreviewToggle<cr>",
          desc = "Markdown Preview",
        },
      },
      config = function()
        vim.cmd([[do FileType]])
      end,
    },

	-- git
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
			-- vim.keymap.set("n", "<leader>gp", ":Git push<CR>") -- think about this :)
		end,
	},

	-- git diff things c:
	{ "akinsho/git-conflict.nvim", version = "*", opts = {}},

}
