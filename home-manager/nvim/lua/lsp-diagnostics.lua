local yo_lsp_diagnostics = function()
    local i = require("icons").diagnostics
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = i.Error,
                [vim.diagnostic.severity.WARN] = i.Warning,
                [vim.diagnostic.severity.HINT] = i.Hint,
                [vim.diagnostic.severity.INFO] = i.Information,
            }
        },
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = {
            "n:i",
            "v:s",
        },
        desc = "Disable diagnostics in insert & select mode",
        callback = function(e) vim.diagnostic.disable(e.buf) end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = {
            "i:n",
        },
        desc = "Enable diagnostics when leaving insert mode",
        callback = function(e) vim.diagnostic.enable(e.buf) end,
    })
end

yo_lsp_diagnostics()
