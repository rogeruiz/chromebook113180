local yo_gitsigns = function ()
    local plugin = require("gitsigns")
    local ui = require("icons").git.ui
    local opts = {
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = ui.add,
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn" ,
            },
            change = {
                hl = "GitSignsChange",
                text = ui.change,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn"
            },
            delete = {
                hl = "GitSignsDelete",
                text = ui.delete,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn"
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = ui.topdelete,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn"
            },
            changedelete = {
                hl = "GitSignsChange",
                text = ui.changedelete,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            untracked = {
                hl = "GitSignsAdd",
                text = ui.untracked,
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn"
            },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        yadm = {
            enable = false,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                else
                    vim.schedule(function()
                        plugin.next_hunk()
                    end)
                    return "<Ignore>"
                end
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                else
                    vim.schedule(function()
                        plugin.prev_hunk()
                    end)
                    return "<Ignore>"
                end
            end, { expr = true })

            -- Actions
            map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Git hunk stage" })
            map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Git hunk reset" })
            map("n", "<leader>hS", gs.stage_buffer, { desc = "Git buffer stage" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git undo stage" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "Git buffer reset" })
            map("n", "<leader>hp", gs.preview_hunk, { desc = "Git preview hunk" })
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "Git blame line" })
            map("n", "<leader>tb", gs.toggle_current_line_blame,
            { desc = "Palanca para mostrar linea de `git blame`" })
            map("n", "<leader>hd", gs.diffthis, { desc = "Git diff file" })
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, { desc = "" })
            map("n", "<leader>td", gs.toggle_deleted, { desc = "Git toggle deletions" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git text objects select_hunk" })
        end,
    }
    plugin.setup(opts)
end

yo_gitsigns()
