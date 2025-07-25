if vim.g.vscode then
  -- VSCode Neovim
  require('config.vscode.options')
  require('config.vscode.keymaps')
  require('config.vscode.autocmds')
  require('config.vscode.jumplist')
else
  -- Neovim
  require('config.lazy')
  require('config.options')
  require('config.keymaps')
  require('config.autocmds')
end
