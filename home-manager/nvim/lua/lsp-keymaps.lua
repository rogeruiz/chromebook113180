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
