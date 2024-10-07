return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
    },
    opts = {
        -- a list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = {
            "javascript",
            "typescript", 
            "go",
            "java",
            "c",
            "lua",
            "vim",
            "haskell",
            "scala",
            "help",
            "vimdoc",
        },

        -- install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- automatically install missing parsers when entering buffer
        -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
        auto_install = true,
        ignore_install = { "help" },
        highlight = {
            enable = true,
            -- setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- using this option may slow down your editor, and you may see some duplicate highlights.
            -- instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        -- query_linter = {
        -- 	enable = true,
        -- 	use_virtual_text = true,
        -- 	lint_events = { "bufwrite", "cursorhold" },
        -- },
    },
}
