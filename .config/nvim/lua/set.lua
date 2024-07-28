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
vim.opt.relativenumber=true     --add line numbers
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
                                --add relative numbers for netrw as well
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
vim.cmd.colorscheme 'nordic'

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', 'L', vim.lsp.buf.rename, { buffer = args.buf })
  end,
})

vim.opt.colorcolumn = '100'

