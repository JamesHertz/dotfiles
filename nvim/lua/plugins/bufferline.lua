return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            options    = { always_show_bufferline = false, },
            highlights = {
                    background = { fg = 'None', bg = 'None', },
                    fill       = { fg = 'None', bg = 'None', },
            },
        })

        -- move left and right
        vim.keymap.set(
            "n", "L", ":BufferLineCycleNext<CR>", { desc = "Move next buffer", silent = true }
        )
        vim.keymap.set(
            "n", "H", ":BufferLineCycleNext<CR>", { desc = "Move previos buffer", silent = true }
        )

        -- close buffers
        vim.keymap.set(
            "n", "<leader>br", ":BufferLineCloseRight<CR>", { 
                desc = "Close all buffers to the right", silent = true 
            }
        )
        vim.keymap.set(
            "n", "<leader>bl", ":BufferLineCloseRight<CR>", { 
                desc = "Close all buffers to the left", silent = true 
            }
        )
        vim.keymap.set(
            "n", "<leader>bo", ":BufferLineCloseOthers<CR>", { 
                desc = "Close all other buffers", silent = true 
            }
        )
    end
}
