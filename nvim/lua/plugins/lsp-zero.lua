-- used to make lua_ls neovim aware (source https://github.com/neovim/neovim/discussions/24119#discussioncomment-9137639)
local lua_ls_opts = {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        })
      end,
      settings = {Lua = {}}
}

local function lsp_config()
	local lsp = require("lsp-zero")
	lsp.preset("recommended")
    -- Mason install other lsp
	lsp.ensure_installed({
        "lua_ls"
	})

	-- Fix Undefined global 'vim'
	lsp.configure("lua-language-server", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})

	cmp_mappings["<Tab>"] = nil
	cmp_mappings["<S-Tab>"] = nil

	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
	})

	lsp.set_preferences({
		suggest_lsp_servers = false,
		sign_icons = {
			error = "E",
			warn = "W",
			hint = "H",
			info = "I",
		},
	})

	lsp.on_attach(function(_, bufnr)
		local opts = { buffer = bufnr, remap = false }
        local map  = vim.keymap.set
        local api  = vim.lsp.buf
        local diagnostic = vim.diagnostic

		map("n", "gd",          function() api.definition() end, opts)
		map("n", "K",           function() api.hover() end, opts)
		map("n", "<leader>vws", function() api.workspace_symbol() end, opts)
		map("n", "<leader>vd",  function() diagnostic.open_float() end, opts)
		map("n", "[d",          function() diagnostic.goto_next() end, opts)
		map("n", "]d",          function() diagnostic.goto_prev() end, opts)
		map("n", "<leader>vrr", function() api.references() end, opts)
		map("n", "<leader>vrn", function() api.rename() end, opts)
		map("i", "<C-h>",       function() api.signature_help() end, opts)
		map("n", "<leader>a",   function() api.code_action() end, opts)

	end)

	lsp.setup()
    require('lspconfig').lua_ls.setup(lua_ls_opts)
	-- vim.diagnostic.config({
	-- 	virtual_text = true,
	-- })
end

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
        lazy = false,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = lsp_config,
	},

    -- error boxes
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opts = {} },

}
