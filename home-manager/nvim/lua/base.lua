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

-- Filetype mappings
vim.cmd([[
  au BufRead,BufNewFile *.jshintrc set ft=json
  au BufRead,BufNewFile *.bowerrc set ft=json
  au BufRead,BufNewFile *.pantheonrc set ft=json
  au BufRead,BufNewFile *.eslintrc set ft=json
  au BufRead,BufNewFile *.txt set ft=markdown
  au BufRead,BufNewFile *.text set ft=markdown
  au BufRead,BufNewFile *.applescript set ft=applescript
  au BufNewFile,BufRead *.php set ft=php.html.js.css
  au BufNewFile,BufRead *.blade.php set ft=blade.html.php
  au BufNewFile,BufRead *.ejs set ft=liquid.html.js.css
  au BufNewFile,BufRead *.twig set ft=html.twig
  au BufNewFile,BufRead *.toml set ft=toml
  au BufNewFile,BufRead *.js set ft=javascript
  au BufNewFile,BufRead *.jsx set ft=javascript
  au BufNewFile,BufRead nginx.config set ft=nginx
  au BufRead,BufNewFile spec set ft=yaml
  au BufNewFile,BufRead *.ledger set ft=ledger
  au BufNewFile,BufRead .env* set ft=sh
  au BufNewFile,BufRead Brewfile set ft=ruby
  au BufNewFile,BufRead sketchybarrc set ft=sh
]])

vim.cmd([[
  au TermOpen * setlocal nonumber norelativenumber
]])

-- Filetypes configurations
vim.cmd([[
  au FileType markdown setlocal shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list
  au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType toml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=80 wm=0 linebreak list
]])
