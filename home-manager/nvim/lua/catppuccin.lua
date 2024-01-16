local yo_catppuccin = function()
    require('catppuccin').setup({
        -- flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
            -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.5,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = { "bold" },
            booleans = { "bold" },
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            alpha = true,
            cmp = true,
            dap = true,
            dap_ui = true,
            fidget = true,
            gitsigns = true,
            illuminate = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false
            },
            lsp_trouble = true,
            markdown = true,
            mason = true,
            mini = false,
            -- native_lsp = true,
            navic = true,
            neotree = true,
            noice = true,
            telescope = true,
            telekasten = true,
            ts_rainbow2 = true,
            which_key = true,
            window_picker = true,
        },
    })
    vim.cmd.colorscheme 'catppuccin'
    vim.o.termguicolors = true
    vim.o.background = "dark"
end

yo_catppuccin()
