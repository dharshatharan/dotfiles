lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.defaults.layout_config = {
  horizontal = {
    width = 0.9,
    height = 0.9,
    prompt_position = "top",
  },
  vertical = {
    width = 0.9,
    height = 0.9,
  },
}

lvim.builtin.telescope.pickers.find_files = {
  path_display = { "absolute" },
  wrap_results = true,
  hidden = true,
  file_ignore_patterns = { '.git/' }
}
lvim.builtin.telescope.pickers.git_files = {
  hidden = true,
  show_untracked = true,
  path_display = { "absolute" },
  wrap_results = true,
}
