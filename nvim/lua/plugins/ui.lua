return {
    {
        "folke/tokyonight.nvim",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("tokyonight").setup {
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            }
            vim.cmd.colorscheme "tokyonight"
        end
    },

    {
        'echasnovski/mini.nvim',
        config = function()
             require('mini.statusline').setup {
                 use_icons = true
             }
        end
    },
}
