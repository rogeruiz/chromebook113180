local yo_telekasten = function()
    require("telekasten").setup({
        home = vim.fn.expand("~/Dropbox/zettelkasten"),
        auto_set_filetype = false,
    })

    vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
    vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
    vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
    vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
    vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
    vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
    vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
    vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
    vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>")

    require("zen-mode").setup({
        window = {
            backdrop = 0.88,
        },
        plugins = {
            gisigns = {
                enabled = true,
            },
            tmux = {
                enabled = true,
            },
            alacritty = {
                enabled = true,
                font = "10",
            }
        },
    })

    vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<cr>")
end

yo_telekasten()
