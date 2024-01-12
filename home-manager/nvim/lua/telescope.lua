local bts = require('telescope.builtin')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    theme = "dropdown",
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.60,
      height = 0.85,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', bts.oldfiles, { desc = '[?] Buscar en los archivos recientes' })
vim.keymap.set('n', '<leader><space>', bts.buffers, { desc = '[ ] Buscar en búferes abiertos' })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  bts.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Búsqueda aproximada en el búfer actual' })

vim.keymap.set('n', '<leader>ba', bts.find_files, { desc = '[B]uscar [A]rchivos' })
vim.keymap.set('n', '<leader>bs', bts.help_tags, { desc = '[B]uscar [S]ocorro' })
vim.keymap.set('n', '<leader>bp', bts.grep_string, { desc = '[B]uscar la [P]alabra actual' })
vim.keymap.set('n', '<leader>bg', bts.live_grep, { desc = '[B]uscar con [G]rep' })
vim.keymap.set('n', '<leader>bd', bts.diagnostics, { desc = '[B]uscar [D]iagnóstico' })
vim.keymap.set('n', '<leader>br', bts.resume, { desc = '[B]uscar [R]eanudar' })
