local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>","<Nop>", opts)
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Normal --
-- Reload Vim Files
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)

keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Move text up and down
keymap("n", "<M-j>", "<Esc>:move .+1<CR>==", opts)
keymap("n", "<M-k>", "<Esc>:move .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">" ,">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":move .+1<CR>==", opts)
keymap("v", "<M-k>", ":move .-2<CR>==", opts)

keymap("v", "p", '"_dp', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv",opts)
keymap("x", "K", ":move '<-2<CR>gv-gv",opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv",opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv",opts)

-- Plugins Keymaps --

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "R", ":NvimTreeRefresh<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope", opts)
keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>pw", ":lua require('telescope.builtin').grep_string {search = vim.fn.expand(\"<cword>\") }<CR>", opts)
keymap("n", "<leader>pb", ":lua require('telescope.builtin').buffers()<CR>", opts)
