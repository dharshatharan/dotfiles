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
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      -- [[ Configure Telescope ]]
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local lga_actions = require("telescope-live-grep-args.actions")

      -- See `:help telescope` and `:help telescope.setup()`
      telescope.setup {
        defaults = {
          mappings = {
            n = {
              ['<c-x>'] = actions.delete_buffer
            },
            i = {
              ['<c-x>'] = actions.delete_buffer,
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-f>"] = actions.to_fuzzy_refine,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension("live_grep_args"))
      pcall(telescope.load_extension "file_browser")

      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
        { desc = '[/] Fuzzily search in current buffer' })

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Git Files' })
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find Help' })
      vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find Current Word' })
      vim.keymap.set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
      vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostic' })
      vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = 'Find References' })
      vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols,
        { desc = 'Find Document Symbols' })
      vim.keymap.set('n', '<leader>fm', require('telescope.builtin').marks, { desc = 'Find Marks' })
      vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix, { desc = 'Find Quickfix' })
      vim.keymap.set('n', '<leader>.',
        ":lua require'telescope'.extensions.file_browser.file_browser{path = vim.fn.expand('%:p:h'), cwd_to_path = true, prompt_path = true}<CR>",
        { desc = 'File browser' })
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
