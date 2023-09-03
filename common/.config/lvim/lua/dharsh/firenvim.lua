vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
  callback = function(e)
    if not not vim.g.started_by_firenvim then
      if vim.g.timer_started == true then
        return
      end
      vim.g.timer_started = true
      vim.fn.timer_start(5000, function()
        vim.g.timer_started = false
        vim.cmd.write()
      end)
    end
  end
})

vim.g.firenvim_config = {
  localSettings = {
    [".*"] = {
      takeover = "never"
    }
  }
}
