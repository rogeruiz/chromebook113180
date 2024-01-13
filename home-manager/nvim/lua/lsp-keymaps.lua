-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<c-down>', ':resize -2<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-up>', ':resize +2<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-right>', ':vertical resize -2<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-left>', ':vertical resize +2<cr>', { noremap = true, silent = true })

-- keymaps para aumentar la indentacíon
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', {
    desc = "Open float for diagnostics",
})

vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', {
    desc = "Move to previous diagnostic"
})

vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', {
    desc = "Move to next diagnostic"
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = "LSP actions",
    callback = function(event)
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = event.buf }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Trigger code completion
        bufmap('i', '<C-Space>', '<C-x><C-o>')

        -- Display documentation of the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- jump to definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- jump to definition
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- List all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type of symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- Displays a function's signature information
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Format the current file
        bufmap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.format()<cr>')

        -- Selects a code action available at the current cursor position
        bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    end
})
