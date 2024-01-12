---@module 'bufferline'
---@author 'Roger Steve Ruiz'
---@license 'MIT'

return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { "<leader>tc",  "<cmd>BufferLinePickClose<cr>",  desc = "Escojer el búfer para cerrar" },
        { "<leader>tcl", "<cmd>BufferLineCloseLeft<cr>",  desc = "Ciere los búfers de la izquierda" },
        { "<leader>tcr", "<cmd>BufferLineCloseRight<cr>", desc = "Ciere los búfers de la derecha" },
        { "<S-h>",       "<cmd>:bprevious<cr>",           desc = "Mover al búfer de la izquierda" },
        { "<S-l>",       "<cmd>:bnext<cr>",               desc = "Mover al búfer de la derecha" },
    },
    lazy = false,
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            max_name_length = 20,
            separator_style = "padded_slant",
            always_show_bufferline = true,
            tab_size = 20,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Explorador",
                    text_align = "center",
                },
            },
            numbers = function(opts)
                return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
            end,
        }
    },
}
