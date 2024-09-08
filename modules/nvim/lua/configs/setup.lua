require("nvim-surround").setup({})
require("gitblame").setup({
    enabled = false,
})

vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup({})

require("noice").setup({})
require("fidget").setup({})
require("trouble").setup({})
require("gitsigns").setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
                return ']c'
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
                return '[c'
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
    end,
})

require("oil").setup({})
require("neogit").setup({})
require("Comment").setup({})
