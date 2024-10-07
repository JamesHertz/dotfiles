local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			-- import = "lazyvim.plugins",
			-- opts = { colorscheme = "catppuccin", },
		},
		-- { import = "lazyvim.plugins.extras.linting.eslint" },
		-- { import = "lazyvim.plugins.extras.formatting.prettier" },
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.lang.clangd" },
		-- { import = "lazyvim.plugins.extras.lang.cmake" },
		-- { import = "lazyvim.plugins.extras.lang.markdown" },
		-- { import = "lazyvim.plugins.extras.lang.tailwind" },
		-- { import = "lazyvim.plugins.extras.lang.docker" },
		-- -- { import = "lazyvim.plugins.extras.lang.rust" },
		-- -- { import = "lazyvim.plugins.extras.lang.haskell" },
		-- -- { import = "lazyvim.plugins.extras.coding.copilot" },
		-- { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{ import = "plugins" },
	},

    defaults = { lazy = false, version = false, },
})

vim.diagnostic.config{
  virtual_text = false,
}
