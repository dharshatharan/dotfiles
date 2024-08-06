return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    "kana/vim-textobj-entire",
    dependencies = { "kana/vim-textobj-user" },
  },
}
