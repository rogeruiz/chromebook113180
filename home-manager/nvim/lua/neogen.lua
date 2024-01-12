local neogen = {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
        enabled = true,
        languages = {
            lua = {
                template = {
                    annotation_convention = "emmylua",
                },
            },
        },
    },
    config = true,
}

local opts = {
    noremap = true,
    silent = true,
    desc = "[G]enerar comentarios con [N]eogen",
}
vim.api.nvim_set_keymap("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)

return neogen
