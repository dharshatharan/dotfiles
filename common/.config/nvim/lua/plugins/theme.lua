return {
  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'

      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })

      local colors = require("rose-pine.palette")
      local TelescopeColor = {
        -- TelescopeMatching = { fg = colors.highlight_med },
        -- TelescopeSelection = { fg = colors.text, bg = colors.surface, bold = true },

        -- TelescopePromptPrefix = { bg = colors.surface },
        TelescopePromptNormal = { bg = colors.overlay },
        -- TelescopeResultsNormal = { bg = colors.overlay },
        -- TelescopePreviewNormal = { bg = colors.overlay },
        TelescopePromptBorder = { bg = colors.overlay, fg = colors.overlay },
        TelescopeResultsBorder = { bg = colors.surface, fg = colors.surface },
        TelescopePreviewBorder = { bg = colors.surface, fg = colors.surface },
        TelescopePromptTitle = { bg = colors.rose, fg = colors.overlay },
        TelescopeResultsTitle = { fg = colors.surface },
        TelescopePreviewTitle = { bg = colors.rose, fg = colors.overlay },


        LazyGitBorder = { bg = colors.surface, fg = colors.surface },
        -- LazyGitFloat = { bg = colors.surface, fg = colors.surface }

        -- NvimTreeNormal = { bg = colors.surface, fg = colors.surface },
        WinSeparator = { bg = colors.base, fg = colors.surface },
      }

      for hl, col in pairs(TelescopeColor) do
        vim.api.nvim_set_hl(0, hl, col)
      end
    end,
  },
}
