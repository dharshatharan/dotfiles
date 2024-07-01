return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      -- Switch for controlling whether you want autoformatting.
      --  Use :KickstartFormatToggle to toggle autoformatting on or off
      local format_is_enabled = true
      vim.api.nvim_create_user_command('KickstartFormatToggle', function()
        format_is_enabled = not format_is_enabled
        print('Setting autoformatting to: ' .. tostring(format_is_enabled))
      end, {})

      -- Create an augroup that is used for managing our formatting autocmds.
      --      We need one augroup per client to make sure that multiple clients
      --      can attach to the same buffer without interfering with each other.
      local _augroups = {}
      local get_augroup = function(client)
        if not _augroups[client.id] then
          local group_name = 'kickstart-lsp-format-' .. client.name
          local id = vim.api.nvim_create_augroup(group_name, { clear = true })
          _augroups[client.id] = id
        end

        return _augroups[client.id]
      end

      -- Whenever an LSP attaches to a buffer, we will run this function.
      --
      -- See `:help LspAttach` for more information about this autocmd event.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
        -- This is where we attach the autoformatting for reasonable clients
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf

          -- Only attach to clients that support document formatting
          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          if client.name == 'tsserver' then
            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --   group = get_augroup(client),
            --   buffer = bufnr,
            --   callback = function()
            --     if not format_is_enabled then
            --       return
            --     end
            --
            --     vim.api.nvim_command(':%!prettierd %')
            --   end,
            -- })
            return
          end

          -- Create an autocmd that will run *before* we save the buffer.
          --  Run the formatting command for the LSP that has just attached.
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if not format_is_enabled then
                return
              end

              vim.lsp.buf.format {
                async = false,
                filter = function(c)
                  return c.id == client.id
                end,
              }
            end,
          })
        end,
      })
    end,
  },
  {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json' },
    config = function()
      vim.cmd([[
      augroup PrettierAutoFormat
        autocmd!
        autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json PrettierAsync
      augroup END
    ]])
    end
  },
  {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/lsp-status.nvim' },
    config = function()
      require('lsp-status').register_progress()
      local lspconfig = require('lspconfig')
      local null_ls = require('null-ls')

      -- Enable null-ls integration
      require('lspconfig')['null-ls'].setup {}

      -- Configure LSP servers for JavaScript and TypeScript
      lspconfig.tsserver.setup {}

      -- Enable ESLint
      require('lint-config').init({
        linters = {
          eslint = {
            sourceName = 'eslint',
            command = 'eslint',
            rootPatterns = { '.eslintrc.js', '.eslintrc.json' },
            debounce = 100,
            args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
            parseJson = {
              errorsRoot = '[0].messages',
              line = 'line',
              column = 'column',
              endLine = 'endLine',
              endColumn = 'endColumn',
              message = '${message} [${ruleId}]',
              security = 'severity'
            },
            securities = { [2] = 'error', [1] = 'warning' },
          },
        },
        lintSource = 'eslint',
        formatFiletypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
      })
    end
  }
}
