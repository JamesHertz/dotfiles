return {
    -- git diff things c:
    { "akinsho/git-conflict.nvim",                    version = "*", opts = {} },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- install lsp servers
            { "williamboman/mason.nvim", opts = {} },
            -- auto completion c:
            {
                'saghen/blink.cmp',
                dependencies = 'rafamadriz/friendly-snippets',
                version = 'v0.*',
                opts = {
                    keymap     = { preset = 'enter' },
                    completion = { list = { selection = { auto_insert = true } } },
                    appearance = {
                        use_nvim_cmp_as_default = true,
                        nerd_font_variant = 'mono'
                    },
					sources = {
						default = { "lsp", "path" },
					},
                    signature  = { enabled = true }
                },
            },
            { -- helps mason use lspconfig to configure lsp servers
                "williamboman/mason-lspconfig.nvim",
                dependencies = {},
                opts = {
                    ensure_installed = { "lua_ls", "clangd", "gopls", "pyright", "ts_ls" },
                    handlers = {
                        function(server_name) -- default handler (optional)
                            if server_name ~= "ltex" then
								require("lspconfig")[server_name].setup({
									capabilities = require('blink.cmp').get_lsp_capabilities()
								})
								-- local capabilities = require('blink.cmp').get_lsp_capabilities()
								-- local opts = {  capabilities = capabilities }
                                -- opts.on_!attach = function(_, _)
                                --     -- rest of your on_attach process.
                                --     -- print "loading ltex_extra"
                                --     require("ltex_extra").setup {}
                                -- end
                            end
                        end,
                    }
                }
            },
        },

        config = function()
            -- vim.diagnostic.config({ virtual_text = true })
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function()
                    vim.lsp.inlay_hint.enable(true)
                    vim.diagnostic.config({ virtual_text = true })

                    local map = vim.keymap.set
                    map("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Lsp jump to definition" })
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Lsp code action" })
                    map("n", "<leader>cf", vim.lsp.buf.format, { buffer = 0, desc = "Lsp code format" })
                    map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "Lsp rename" })
                    map("n", "<leader>ce", vim.diagnostic.setqflist, { buffer = 0, desc = "Lsp quickfix error" })
                end,
            })
        end
    },

    -- { "neovim/nvim-lspconfig", opts = { diagnostics = { virtual_text = false } } },  -- fix log messages },,
    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opts = {}, dependencies = "neovim/nvim-lspconfig" },

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

            local action_state = require 'telescope.actions.state'
            vim.keymap.set('n', "<leader>b", function()
                builtin.buffers {
                    sort_mru = true,
                    attach_mappings = function(prompt_bufnr, map)
                        map('n', 'dd', function()
                            local buffers = action_state.get_current_picker(prompt_bufnr)
                            buffers:delete_selection(function(entry)
                                vim.api.nvim_buf_delete(entry.bufnr, {force = true} )
                            end)
                        end)
                        return true
                    end
                }
            end)

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

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('todo-comments').setup {}
            vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', {
                desc   = "Search for todo's",
                silent = true
            })
        end
	},
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
