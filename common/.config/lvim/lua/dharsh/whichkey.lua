lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope find_files hidden=true<cr>", "Find files" },
  g = { "<cmd>Telescope git_files<cr>", "Git files" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  H = { "<cmd>Telescope highlights<cr>", "Highlights" },
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  p = { "<cmd>Telescope projects<cr>", "Projects" },
}

lvim.builtin.which_key.mappings.b.f = {
  "<cmd>Telescope buffers<cr>",
  "Find"
}

lvim.builtin.which_key.mappings.s.r = { "<cmd>lua require('spectre').open()<cr>", "Search and Replace" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Show",
  d = { "<cmd>lua require 'dharsh.terminal'.lazydocker_toggle()<cr>", "LazyDocker" },
  o = { "<cmd>SymbolsOutline<cr>", "Outline" },
  u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
}

lvim.builtin.which_key.mappings.h = { require('hover').hover, "Hover" }
lvim.builtin.which_key.mappings.H = { require('hover').hover_select, "Hover Select" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }

lvim.builtin.which_key.setup.plugins.presets.z = true

-- Copilot
lvim.builtin.which_key.mappings.C = {
  name = "Copilot",
  d = { "<cmd>Copilot disable<cr>", "Disable" },
  e = { "<cmd>Copilot enable<cr>", "Enable" },
  p = { "<cmd>Copilot panel<cr>", "Panel" },
  s = { "<cmd>Copilot status<cr>", "Status" },
}

-- Open files
lvim.builtin.which_key.mappings.o = {
  name = "Open",
  i = { "<cmd>!xdg-open %<cr>", "Image Preview" },
}
