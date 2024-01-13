vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.hlsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "50,72,80,100"
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamed'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = false
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.smartindent = true
vim.o.whichwrap = "<,>,h,l"
vim.o.swapfile = false
vim.o.listchars = "eol:¬,tab:›·,trail:·,extends:›,precedes:‹"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 5
vim.o.spelllang = "en,es"

-- [[ basic keymaps ]]

-- keymaps for better default experience
-- see `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

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

local icons = require('icons')
