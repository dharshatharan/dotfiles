return {
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  {
    "Davidyz/VectorCode",
    version = "*",
    build = "pipx upgrade vectorcode", -- recommended if you set `version = "*"` or follow the main branch
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-sonnet-4",
          },
        },
      },
      display = {
        chat = {
          window = {
            layout = 'float',
            width = 0.9,
            height = 0.9,
          }
        }
      },
      extensions = {
        vectorcode = {
          opts = { add_tool = true, add_slash_command = true, tool_opts = {} },
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true,           -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          }
        }
      }
    },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanionChat Toggle" },
      { "<leader>ce", "<cmd>CodeCompanion<cr>",            desc = "CodeCompanion" },
      { "<leader>cC", "<cmd>CodeCompanionAction<cr>",      desc = "CodeCompanionAction" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
