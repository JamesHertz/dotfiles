return {
    -- haskell
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^4", -- Recommended
    },

    -- Rust stuffs
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        config = function()
            vim.g.rustaceanvim = {
                -- Plugin configuration
                tools  = { enable_nextest = false },
				server = { status_notify_level = false }, -- surpress warnings
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        capabilities = require('blink.cmp').get_lsp_capabilities()
                    },
                },
            }
        end
    },

    -- comments
    { "folke/ts-comments.nvim", event = "VeryLazy", },

    -- linting
    "mfussenegger/nvim-lint",

    -- lazy vim
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                "LazyVim"
            },
        },
    },
}
