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

map("n", "<s-l>", "gt", { remap = true, desc = "Previous tab"})
map("n", "<s-h>", "gT", { remap = true, desc = "Next tab"})

map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")

map("n", "-", "<cmd>Oil<CR>")
map("n", "<leader>ch", '<cmd>let @/ = ""<CR>', { desc = "Clear highlights" } )

-- map("n", ":cnext", ":!./%<CR>", { silent = true, desc = "Exec current file" })
vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = { enable_nextest = false },
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
            capabilities = require('blink.cmp').get_lsp_capabilities()
      },
    },
}
