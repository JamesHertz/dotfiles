local map = vim.keymap.set

-- copy and paste to clipboard
map("v", "<leader>y", [["+y]], { desc = "Copy to clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })

-- comments
map({ "n", "v" }, "<C-l>", "gcc", { desc = "Comment a line of code", remap = true })

-- moving hole paragraphs
map("v", "<c-k>", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>gv=gv", { silent = true })
map("n", "<leader>cx", ":!chmod +x %<CR>", { silent = true, desc = "Add exec permission to current file" })
map("n", "<leader>r", ":!./%<CR>", { silent = true, desc = "Exec current file" })
