local yo_neo_tree = function()
    require('neo-tree').setup({
        enable_git_status = true,
        enable_diagnostics = true,
        source_selector = {
            windbar = false,
            statusline = false,
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    })

    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    vim.keymap.set('n', '<leader>o', '<cmd>Neotree float<cr>', { desc = 'Enfocar el Explorardor' })
    vim.keymap.set('n', '<leader>gs', '<cmd>Neotree float git_status<cr>', { desc = 'Obtener el estado de Git' })
end

yo_neo_tree()
