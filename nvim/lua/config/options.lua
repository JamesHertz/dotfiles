-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.autoformat = false

-- tab related things
vim.opt.tabstop      = 4
vim.opt.softtabstop  = 4
vim.opt.shiftwidth   = 4
vim.opt.expandtab    = true
-- vim.opt.expandtab = true -- (uses spaces instead of tabs)
-- vim.g.rust_recommended_style = 0

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.colorcolumn = "100"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.clipboard = ""
-- vim.opt.winbar = "%=%m %f"
vim.diagnostic.config({
  virtual_text = true,
})
