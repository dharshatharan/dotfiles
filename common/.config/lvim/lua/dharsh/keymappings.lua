lvim.leader = "space"

-- NOH
lvim.keys.normal_mode["<Esc>"] = "<cmd>noh<cr>"

-- Save
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Tab Navigation
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<C-f>"] = "<cmd>silent !tmux neww tmux-sessionizer<cr>"
