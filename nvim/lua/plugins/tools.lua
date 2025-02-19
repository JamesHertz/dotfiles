return {
    -- git diff things c:
    { "akinsho/git-conflict.nvim",                    version = "*", opts = {} },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- install lsp servers
            { "williamboman/mason.nvim", opts = {} },
            { -- helps mason use lspconfig to configure lsp servers
                "williamboman/mason-lspconfig.nvim",
                dependencies = {},
                opts = {
                    ensure_installed = { "lua_ls", "clangd" },
                    handlers = {
                        function(server_name) -- default handler (optional)
                            local capabilities = require('blink.cmp').get_lsp_capabilities()
                            require("lspconfig")[server_name].setup { capabilities = capabilities }
                        end,
                    }
                }
            },

            -- auto completion c:
            {
                'saghen/blink.cmp',
                dependencies = 'rafamadriz/friendly-snippets',
                version = 'v0.*',
                opts = {
                    keymap     = { preset = 'enter' },
                    completion = { list = { selection = 'auto_insert' } },
                    appearance = {
                        use_nvim_cmp_as_default = true,
                        nerd_font_variant = 'mono'
                    },

                    signature  = { enabled = true }
                },
            }
        },

        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function()
                    vim.lsp.inlay_hint.enable(true)

                    local map = vim.keymap.set
                    map("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Lsp jump to definition" })
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Lsp code action" })
                    map("n", "<leader>cf", vim.lsp.buf.format, { buffer = 0, desc = "Lsp code format" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "Lsp code format" })
                end,
            })
        end
    },
    -- { "neovim/nvim-lspconfig", opts = { diagnostics = { virtual_text = false } }  -- fix log messages },

    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opts = {} },

    { -- gets a list of parsers for me
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require 'nvim-treesitter.configs'.setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    -- Documentation: https://github.com/nvim-treesitter/nvim-treesitter
                },
            }
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup {
                pickers = {
                    find_files = { theme = "ivy" },
                    help_tags  = { theme = "ivy" },
                    live_grep  = { theme = "ivy" },
                    git_files  = { theme = "ivy" },
                    buffers    = { theme = "ivy" },
                },
                extensions = { fzf = {} }
            }
            require('telescope').load_extension('fzf')

            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', "<leader>sh", builtin.help_tags)
            vim.keymap.set('n', "<leader>sf", builtin.find_files)
            vim.keymap.set('n', "<leader>sg", builtin.git_files)
            vim.keymap.set('n', "<leader>ss", builtin.live_grep)
            -- TODO: follow this tutorial https://medium.com/@jogarcia/delete-buffers-on-telescope-21cc4cf61b63
            vim.keymap.set('n', "<leader>b", builtin.buffers)

            vim.keymap.set('n', "<leader>sn", function()
                builtin.find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)

            vim.keymap.set("n", "<leader>sp", function()
                builtin.find_files {
                    ---@diagnostic disable-next-line: param-type-mismatch
                    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
                }
            end)
        end
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },

}
