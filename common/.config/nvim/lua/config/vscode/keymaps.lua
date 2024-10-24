-- [[ Basic Keymaps ]]


-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Esc>', vim.cmd.noh)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Sane scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy Caos
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Git
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true, silent = true })

-- Tab navigation
vim.keymap.set('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '9gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>0', '10gt', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tq', '<cmd>tabclose<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', { noremap = true, silent = true })
