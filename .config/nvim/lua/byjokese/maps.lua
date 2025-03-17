vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>q", "<CMD>quit<CR>")
map("n", "<leader>Q", "<CMD>qa<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Exit terminal mode
map("t", "<C-t>", "<C-\\>:CFloatTerm<CR>", { noremap = true, silent = true })

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")
map("n", "<leader>q", "<CMD>q<CR>")

-- Resize Windows
map("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Harpoon

-- LSPs
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover" })
map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
map("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
map("n", "<leader>cf", "<CMD>lua vim.lsp.buf.formatting()<CR>", { desc = "Format" })
map("n", "<leader>cd", "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { desc = "Show line diagnostics" })
map("n", "<leader>cn", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
map("n", "<leader>cp", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
