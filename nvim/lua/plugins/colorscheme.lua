return {
    {
        "catppuccin/nvim", 
        name   = "catppuccin",
        config = function()
            local lib = require("catppuccin")
            lib.setup({ transparent_background = true })
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
