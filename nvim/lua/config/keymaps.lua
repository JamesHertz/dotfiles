local map = vim.keymap.set

-- copy and paste to clipboard
map("v", "<leader>y", [["+y]], { desc = "copy to clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "paste from clipboard" })

-- comments
map({ "n", "v" }, "<C-l>", "gcc", { desc = "comment a line of code", remap = true })

-- moving hole paragraphs
map("v", "<c-k>", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>gv=gv", { silent = true })
map("n", "<leader>cx", ":!chmod +x %<CR>", { silent = true, desc = "add exec permission to current file" })
map("n", "<leader>r", ":!./%<CR>", { silent = true, desc = "exec current file" })

map("n", "<s-l>", "gt", { remap = true, desc = "previous tab"})
map("n", "<s-h>", "gT", { remap = true, desc = "next tab"})

map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")

map("n", "-", "<cmd>Oil<CR>")
map("n", "<leader>ch", '<cmd>let @/ = ""<CR>', { desc = "Clear highlights" } )

map("n", "<leader>x", ":!chmod +x %<CR>", { desc = "make current file executable" })
map("n", "<leader>r", ":!./%<CR>", { desc = "run current file" })
-- TODO: improve this
map("n", "<leader>o", ":!jopen %<CR>",{ desc = "open current file" })

-- map("n", "<leader>cd", function()
--     vim.api.nvim_create_autocmd('BufWritePost', { command = "!./push.sh" })
--     print "setup CAD commands"
-- end, { desc = "set autocommand to push CUDA code" })

-- TODO: make this more sophisticated
map(
	"n", "<leader>cc", function()
		local cmd = vim.fn.input('command: ')
		if cmd == '' then
			print('no command provided')
		else
			vim.api.nvim_create_autocmd('BufWritePost', { command = cmd })
			print("attached \":" .. cmd .. "\" to BufWritePost autocommand")
		end
	end
);

-- vim.g.rustaceanvim = {
--   -- Plugin configuration
--   tools = { enable_nextest = false },
--     default_settings = {
--       -- rust-analyzer language server configuration
--       ['rust-analyzer'] = {
--             capabilities = require('blink.cmp').get_lsp_capabilities()
--       },
--     },
-- }
