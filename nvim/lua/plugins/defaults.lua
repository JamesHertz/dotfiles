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

    "williamboman/mason.nvim", -- package manager for lsp servers et all
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

    -- botton line
    { 
        'nvim-lualine/lualine.nvim', 
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    }
    
}

