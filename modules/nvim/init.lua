require("configs/setup")
require("configs/keybinds")
require("configs/commands")
require("configs/theming")
require("configs/telescope")
require("configs/lsp")
require("configs/treesitter")
require("configs/cmp")
require("configs/harpoon")

-- Disable case sensitivity
vim.o.ignorecase = true
-- Enable case sensitivity if search contains uppercase
vim.o.smartcase = true


-- Share Clipboard
vim.opt.clipboard = 'unnamedplus'


-- Set Tabs to 4 spaces
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Disable Mouse Actions
vim.o.mouse = ""
