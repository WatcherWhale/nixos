local builtin = require('telescope.builtin')
local utils = require("telescope.utils")
local fb_actions = require "telescope._extensions.file_browser.actions"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values


vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Resume previous telescope search" })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fF', function() builtin.find_files({ cwd = utils.buffer_dir() }) end,
    { desc = "Find files in cwd" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep across files" })
vim.keymap.set('n', '<leader>fG', function() builtin.live_grep({ cwd = utils.buffer_dir() }) end,
    { desc = "Grep across files in cwd" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.api.nvim_set_keymap("n", "<leader>fv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true })
--vim.keymap.set('n', '<leader>u', "<cmd>Telescope undo<cr>")


require("telescope").setup {
    defaults = require('telescope.themes').get_ivy {
        mappings = {
            --["i"] = {
            --    ["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume() end,
            --    ["<C-q>"] = actions.send_to_qflist,
            --}
        },
        sorting_strategy = "ascending",
        theme = "ivy",
        file_ignore_patterns = {
            "node_modules/",
            "build/",
            "dist/",
            "yarn.lock",
            "package-lock.json",
            "crds/",
            "%.bare/**",
            "%.git/",
            "%.trash/",
            "%.obsidian/",
            "%.terraform/",
        }
    },
    pickers = {
        find_files = {
            theme = "ivy",
            hidden = true
        },
        buffers = {
            theme = "ivy",
        },
        git_branches = {
            theme = "ivy"
        },
        live_grep = {
            theme = "ivy"
        },
        oldfiles = {
            theme = "ivy"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            cwd_to_path = true,
            mappings = {
                ["i"] = {
                    ["<C-a>"] = fb_actions.create,
                    ["<C-CR>"] = fb_actions.create_from_prompt,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-m>"] = fb_actions.move,
                    ["<C-y>"] = fb_actions.copy,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-g>"] = fb_actions.goto_parent_dir,
                    ["<C-e>"] = fb_actions.goto_home_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-t>"] = fb_actions.change_cwd,
                    ["<C-f>"] = fb_actions.toggle_browser,
                    ["<C-h>"] = fb_actions.toggle_hidden,
                    ["<C-s>"] = fb_actions.toggle_all,
                    --["<bs>"] = fb_actions.backspace,
                },
                ["n"] = {
                    ["<C-a>"] = fb_actions.create,
                    ["a"] = fb_actions.create,
                    ["r"] = fb_actions.rename,
                    ["m"] = fb_actions.move,
                    ["y"] = fb_actions.copy,
                    ["d"] = fb_actions.remove,
                    ["o"] = fb_actions.open,
                    ["g"] = fb_actions.goto_parent_dir,
                    ["e"] = fb_actions.goto_home_dir,
                    ["w"] = fb_actions.goto_cwd,
                    ["t"] = fb_actions.change_cwd,
                    ["f"] = fb_actions.toggle_browser,
                    ["h"] = fb_actions.toggle_hidden,
                    ["s"] = fb_actions.toggle_all,
                },
            }
        },
    }
}

--pcall(require('telescope').load_extension, 'fzf')

--require('telescope').load_extension('file_browser')
--require('telescope').load_extension('undo')

local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())
end, { desc = '[/] Fuzzily search in current buffer' })

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')


function run_command(cmd)
    local handle = io.popen(cmd)
    if (handle == nil) then
        return {}
    end

    local out = handle:read("*a")
    handle:close()

    local list = {}
    for token in string.gmatch(out, "[^%c]+") do
        table.insert(list, token)
    end
    return list
end

local rebase = function(opts)
    opts = opts or {}
    local out = run_command('git branch --all | tr -d "* " | sed -e "s/remotes\\///g"')

    pickers.new(opts, {
        prompt_title = "rebase from",
        finder = finders.new_table({
            results = out,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(p_bufnr, map)
            actions.select_default:replace(function()
                actions.close(p_bufnr)
                local selection = action_state.get_selected_entry()
                local branch = selection[1]
                vim.cmd("Git rebase -i " .. branch)
            end)
            return true
        end
    }):find()
end

-- Git Bindings
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Checkout specific branch" })
vim.keymap.set('n', '<leader>gm', ':Git checkout master<CR>', { desc = "Checkout master" })
vim.keymap.set('n', '<leader>gp', ':Git pull<CR>', { desc = "Git pull" })
vim.keymap.set('n', '<leader>gPp', ':Git push<CR>', { desc = "Git push" })
vim.keymap.set('n', '<leader>gPf', ':Git push --force<CR>', { desc = "Git push" })
vim.keymap.set('n', '<leader>gPm', ':Git push -o merge_request.create<CR>', { desc = "Git push and create Merge Request" })
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = "Open Neogit" })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = "Start a commit" })
vim.keymap.set('n', '<leader>gs', ':Git switch -c ', { desc = "Create a new branch and switch" })
vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', { desc = "Show the current diff" })
vim.keymap.set('n', '<leader>gr', rebase, { desc = "Rebase the current branch on a diffetrent one" })