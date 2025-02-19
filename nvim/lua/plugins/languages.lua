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
        -- enabled = false,
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
