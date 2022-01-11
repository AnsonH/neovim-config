local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--------------------------------------------------------
------------------------ NORMAL ------------------------
--------------------------------------------------------

-- Mimic VS Code
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "<C-a>", "ggVG", opts)
keymap("n", "<C-z>", "u", opts)
keymap("n", "<C-[>", "<<", opts)
keymap("n", "<C-]>", ">>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Better window navigation
-- eg. "Ctrl+h" instead of "Ctrl+w h" to switch to left window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>q", opts)  -- Close window

-- Open file explorer at the left
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Action without yanking
keymap("n", "<leader>dd", '"_dd', opts)
keymap("n", "<leader>cw", '"_cw', opts)

-- Show name of highlight group under cursor in the command line area
keymap("n", "<C-I>", ':echo "hi: ".synIDattr(synID(line("."),col("."),1),"name")<CR>', opts)

-- Misc
keymap("n", "<Esc>", ":noh<CR>", opts)   -- Clear search highlight


--------------------------------------------------------
------------------------ INSERT ------------------------
--------------------------------------------------------

-- Press jj to enter insert mode
keymap("i", "jj", "<Esc>", opts)

-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Save with <C-s>
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)


--------------------------------------------------------
------------------------ VISUAL ------------------------
--------------------------------------------------------

-- Stay in indent mode
-- Don't use <C-[> or <C-]>. Otherwise, can't leave Visual mode with <Esc>
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Action without yanking
keymap("v", "<leader>d", '"_d', opts)
keymap("v", "p", '"_dP', opts)  -- Paste without yanking


--------------------------------------------------------
--------------------- VISUAL BLOCK ---------------------
--------------------------------------------------------

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


--------------------------------------------------------
----------------------- TERMINAL -----------------------
--------------------------------------------------------

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
