local vscode = require('vscode')
-- [[ Basic Keymaps ]]


-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Esc>', vim.cmd.noh)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- vim.keymap.set('n', '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
-- vim.keymap.set('n', '<leader>e',
--   "<cmd>lua require('vscode').action('workbench.files.action.showActiveFileInExplorer')<CR>")
-- vim.keymap.set('n', '<leader>q', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
vim.keymap.set('n', '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
vim.keymap.set('n', '<leader>ca', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
vim.keymap.set('n', '<leader>gb', "<cmd>lua require('vscode').action('gitlens.toggleFileBlame')<CR>")

vim.keymap.set('n', 'za', "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>",
  { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>",
  { desc = 'Go to next diagnostic message' })

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

-- harpoon keymaps
vim.keymap.set('n', "<leader>ta", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
vim.keymap.set('n', "<leader>tt", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
vim.keymap.set('n', "<leader>te", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
vim.keymap.set('n', "<leader>1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
vim.keymap.set('n', "<leader>2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
vim.keymap.set('n', "<leader>3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
vim.keymap.set('n', "<leader>4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
vim.keymap.set('n', "<leader>5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
vim.keymap.set('n', "<leader>6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
vim.keymap.set('n', "<leader>7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
vim.keymap.set('n', "<leader>8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
vim.keymap.set('n', "<leader>9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")
