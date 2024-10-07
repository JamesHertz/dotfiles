return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            local lib = require('kanagawa')
            lib.setup({ transparent = true })
            lib.load("dragon")
        end
    }
}
