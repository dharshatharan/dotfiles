reload "dharsh.copilot"
reload "dharsh.firenvim"
reload "dharsh.formatters"
reload "dharsh.linters"
reload "dharsh.keymappings"
reload "dharsh.nvim-ufo"
reload "dharsh.plugins"
reload "dharsh.telescope"
reload "dharsh.treesitter"
reload "dharsh.whichkey"

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- -- Change theme settings
lvim.colorscheme = "rose-pine-main"
lvim.transparent_window = true
vim.cmd [[ autocmd ColorScheme * hi NormalNC guibg=NONE ]]
vim.cmd [[ autocmd ColorScheme * hi NormalFloat guibg=NONE ]]
vim.cmd [[ autocmd ColorScheme * hi FloatBorder guibg=NONE ]]
vim.cmd [[ autocmd ColorScheme * hi TelescopeNormal guibg=NONE ]]
vim.cmd [[ autocmd ColorScheme * hi WhichKeyFloat guibg=NONE ]]


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
