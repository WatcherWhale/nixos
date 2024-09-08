vim.g.mapleader = " "

-- Markdown Preview
vim.keymap.set('n', '<leader>M', ':MarkdownPreviewToggle<CR>')

--vim.keymap.set('n', '<leader>m', require('treesj').toggle)

-- Disable ExMode
vim.keymap.set('n', 'q:', '<Nop>')
vim.keymap.set('n', 'q/', '<Nop>')
vim.keymap.set('n', 'q?', '<Nop>')

-- Window Choosing
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Window Sizing
vim.keymap.set('n', '<S-h>', '<C-w>>')
vim.keymap.set('n', '<S-l>', '<C-w><')

-- Window control
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>s', ':split<CR>')

-- Buffer
vim.keymap.set('n', '<leader>bb', ':enew<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>')

vim.keymap.set("n", "<leader>tt", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tn", ":tabNext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabPrevious<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xn", function() require("trouble").next({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Unbind capital Q (Ex Mode)
vim.keymap.set('n', 'Q', '<Nop>')


vim.keymap.set('v', 'p', 'pgvy', { noremap = true })

vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)

vim.keymap.set('n', '<leader>lg', ':Gen Generate<CR>')
vim.keymap.set('v', '<leader>lg', ':Gen Change_Code<CR>')

vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')

vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')

vim.keymap.set('n', '<leader>o', ':Oil<CR>')
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

require("stay-centered").setup()
