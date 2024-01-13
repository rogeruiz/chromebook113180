local yo_toggleterm = function ()
    local on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end

    local on_close = function(_)
        vim.cmd("startinsert!")
    end

    local Terminal = require('toggleterm.terminal').Terminal
    local cpu_toggle = Terminal:new({
        hidden = true,
        cmd = 'btm --default_widget_type cpu --expanded --current_usage --hide_avg_cpu',
        direction = 'float',
        float_opts = {
            border = 'shadow',
            width = 115,
            height = 21,
        },
        close_on_exit = true,
        -- function to run on opening the terminal
        on_open = on_open,
        -- function to run on closing the terminal
        on_close = on_close,
    })
    local generic_toggle = Terminal:new({
        hidden = true,
        direction = 'float',
        float_opts = {
            border = 'shadow',
            width = 100,
            height = 30,
        },
        -- function to run on opening the terminal
        on_open = on_open,
        -- function to run on closing the terminal
        on_close = on_close,
    })
    local build_toggle = Terminal:new({
        hidden = true,
        direction = 'horizontal',
        close_on_exit = true,
        -- function to run on opening the terminal
        on_open = on_open,
        -- function to run on closing the terminal
        on_close = on_close,
    })

    local function _cpu()
        cpu_toggle:toggle()
    end

    local function _generic()
        generic_toggle:toggle()
    end

    local function _build()
        build_toggle:toggle()
    end

    vim.keymap.set('n', '<leader>tf', _generic,
        { desc = "Abrir [T]erminal [F]lotante" })
    vim.keymap.set('n', '<leader>tt', _build,
        { desc = "Abrir [T]erminal para ver [B]uild" })
    vim.keymap.set('n', '<leader>tc', _cpu,
        { desc = "Abrir [T]erminal para ver [C]PU" })
end

yo_toggleterm()
