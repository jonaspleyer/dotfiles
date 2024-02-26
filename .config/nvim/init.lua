require('plugins')
require('mason-config')
require('rust-analyzer')
require('flake8')

vim.opt.showmatch=true          --show matching 
vim.opt.ignorecase=true         --case insensitive 
vim.opt.mouse=v                 --middle-click paste with 
vim.opt.hlsearch=true           --highlight search 
vim.opt.incsearch=true          --incremental search
vim.opt.tabstop=4               --number of columns occupied by a tab 
vim.opt.softtabstop=4           --see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab=true          --converts tabs to white space
vim.opt.shiftwidth=4            --width for autoindents
vim.opt.autoindent=true         --indent a new line the same amount as the line just typed
vim.opt.number=true             --add line numbers
vim.opt.wildmode=longest,list   --get bash-like tab completions
--filetype plugin indent on   "allow auto-indenting depending on file type
--syntax on                   --syntax highlighting
vim.opt.mouse=a                 --enable mouse click
vim.opt.clipboard=unnamedplus   --using system clipboard
--filetype plugin on
vim.opt.cursorline=true         --highlight current cursorline
vim.opt.ttyfast=true            --Speed up scrolling in Vim
--vim.opt.spell                 " enable spell check (may need to download language package)
--vim.opt.noswapfile            " disable creating swap file
--vim.opt.backupdir=~/.cache/vim " Directory to store backup files.

