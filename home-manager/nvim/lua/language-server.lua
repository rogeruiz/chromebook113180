-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ombrar')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinición')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferencias')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementación')
    nmap('<leader>D', vim.lsp.buf.type_definition, '[D]efinición de tipo')
    nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[S]ímbolos de [D]ocumentos')
    nmap('<leader>st', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]ímbolos del Espacio de [T]rabajo')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Documentacíon Flotante')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Documentación Firma')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaracíon')
    nmap('<leader>ta', vim.lsp.buf.add_workspace_folder, 'Espacio de [T]rabajo [A]ñadir Carpeta')
    nmap('<leader>te', vim.lsp.buf.remove_workspace_folder, 'Espacio de [T]rabajo [E]liminar Carpeta')
    nmap('<leader>tl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'Espacio de [T]rabajo [L]ista de Carpertas')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Formatear el búfer actual con LSP' })

    -- Solomente prender ha _navic_ y _lsp-folding_ para ciertos servidores.
    if (client.name ~= "efm" and
            client.name ~= "diagnosticls" and
            client.name ~= "spectral" and
            client.name ~= "eslint" and
            client.name ~= "emmet_ls" and
            client.name ~= "rnix" and
            client.name ~= "tailwindcss") then
        require("nvim-navic").attach(client, bufnr)
    end
end

local lsp_config = function()
    local icons = require("icons")
    local signs = {

        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.set_log_level("OFF")
end

lsp_config()

local lsp_language_servers = function()
    local icons = require("icons")
    local lsp_zero = require("lsp-zero")
    local lc = require("lspconfig")
    lsp_zero.on_attach(on_attach)

    local lua_opts = lsp_zero.nvim_lua_ls()

    lc.lua_ls.setup(lua_opts)
    lc.nixd.setup({})
    lc.gopls.setup({})
    lc.marksman.setup({})

    -- nvim-cmp supports additional completion capabilities, so
    -- broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    luasnip.config.setup({})

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        experimental = {
            ghost_test = true,
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete {},
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s %s", icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                -- NOTE: order matters
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    luasnip = "[LuaSnip]",
                })[entry.source.name]
                return vim_item
            end
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'luasnip' },
        }, {
            { name = "buffer" },
        }),
        cmp.setup.filetype({ 'lisp' }, {
            sources = {
                { name = "nvlime" },
            },
        }),
        cmp.setup.cmdline({ "/", "?" },
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            }),
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        }),
    }
end

lsp_language_servers()
