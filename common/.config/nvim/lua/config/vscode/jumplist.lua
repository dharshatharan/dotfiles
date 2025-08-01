local vscode = require("vscode-neovim")
local previous_jumplist = vim.fn.getjumplist()[1]

local function jump_back()
  vscode.call("jumplist.jumpBack")
end

local function jump_forw()
  vscode.call("jumplist.jumpForward")
end

-- this is not nice, but does the job for now
local function goToDef()
  vscode.call("jumplist.registerJump")
  vscode.call("editor.action.revealDefinition")
end

vim.keymap.set({ "n" }, "<c-o>", jump_back, { noremap = true })
vim.keymap.set({ "n" }, "<c-i>", jump_forw, { noremap = true })
vim.keymap.set({ "n" }, "gd", goToDef, { noremap = true })

local function check_jumplist()
  local current_jumplist = vim.fn.getjumplist()[1]
  if #current_jumplist > #previous_jumplist then
    vscode.call("jumplist.registerJump")
  end
  previous_jumplist = current_jumplist
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = check_jumplist,
})
