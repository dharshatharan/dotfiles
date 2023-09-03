return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '│',
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },

  {
    'ThePrimeagen/harpoon',
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set('n', '<leader>ha', mark.add_file)
      vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu)

      vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
      vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
      vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end)
      vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end)
      vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end)
      vim.keymap.set('n', '<leader>9', function() ui.nav_file(9) end)
      vim.keymap.set('n', '<leader>0', function() ui.nav_file(10) end)

      vim.keymap.set('n', '<leader>hn', function() ui.nav_next() end)
      vim.keymap.set('n', '<leader>hp', function() ui.nav_prev() end)
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Vsplit'))
      end

      require("nvim-tree").setup {
        on_attach = my_on_attach,
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      }

      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    end,
  },
}
