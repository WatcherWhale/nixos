local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ea", function() harpoon:list():append() end, {desc = "Add file to harpoon"})

vim.keymap.set("n", "<leader>ej", function() harpoon:list():select(1) end, {desc = "Select first harpooned file"})
vim.keymap.set("n", "<leader>ef", function() harpoon:list():select(2) end, {desc = "Select seccond harpooned file"})
vim.keymap.set("n", "<leader>eh", function() harpoon:list():select(3) end, {desc = "Select third harpooned file"})
vim.keymap.set("n", "<leader>eg", function() harpoon:list():select(4) end, {desc = "Select fourth harpooned file"})

vim.keymap.set("n", "<leader>en", function() harpoon:list():prev() end, {desc = "Next harpooned file"})
vim.keymap.set("n", "<leader>ep", function() harpoon:list():next() end, {desc = "Previous harpooned file"})


-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>ee", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
