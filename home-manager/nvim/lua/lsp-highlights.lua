local function hide_semantic_highlights()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Clear LSP highlight groups",
    callback = hide_semantic_highlights,
})

-- vim.api.nvim_set_hl(0, "LspReferenceRead", {
--     link = "Search",
-- })
-- vim.api.nvim_set_hl(0, "LspReferenceText", {
--     link = "Search",
-- })
-- vim.api.nvim_set_hl(0, "LspReferenceWrite", {
--     link = "Search",
-- })

vim.opt.updatetime = 400

local function highlight_symbol(event)
    local id = vim.tbl_get(event, "data", "client_id")
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method("textDocument/documentHighlight") then
        return
    end

    local group = vim.api.nvim_create_augroup("highlight_symbol", {
        clear = false,
    })

    vim.api.nvim_clear_autocmds({
        buffer = event.buf,
        group = group,
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.clear_references,
    })
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Setup highlight symbol",
    callback = highlight_symbol
})

-- [[ highlight on yank ]]
-- see `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('yankhighlight', { clear = true })
vim.api.nvim_create_autocmd('textyankpost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
