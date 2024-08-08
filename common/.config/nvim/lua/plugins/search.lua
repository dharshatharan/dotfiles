return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      -- [[ Configure Telescope ]]
      local telescope = require('telescope')

      -- See `:help telescope` and `:help telescope.setup()`
      telescope.setup {
        defaults = {
          mappings = {
            n = {
              ['<c-x>'] = require('telescope.actions').delete_buffer
            },
            i = {
              ['<c-x>'] = require('telescope.actions').delete_buffer
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, 'fzf')


      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
        { desc = '[/] Fuzzily search in current buffer' })

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Git Files' })
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find Help' })
      vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find Current Word' })
      vim.keymap.set('n', '<leader>ft', require('telescope.builtin').live_grep, { desc = 'Grep Text' })
      vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostic' })
    end,
  },
}
