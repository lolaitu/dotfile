vim.cmd("set nocompatible")           --disable compatibility to old-time vi
vim.cmd("set showmatch")              --show matching 
vim.cmd("set ignorecase")             --case insensitive 
vim.cmd("set mouse=v")                --middle-click paste with 
vim.cmd("set hlsearch")               --highlight search 
vim.cmd("set incsearch")              --incremental search
vim.cmd("set expandtab")              --converts tabs to white space
vim.cmd("set tabstop=2")              --number of columns occupied by a tab 
vim.cmd("set softtabstop=2")          --see multiple spaces as tabstops so <BS> does the right thing
vim.cmd("set shiftwidth=2")           --width for autoindents
vim.cmd("set autoindent")             --indent a new line the same amount as the line just typed
vim.cmd("set wildmode=longest,list")  --get bash-like tab completions
vim.cmd("set number")                 --add line numbers
vim.cmd("set relativenumber")         --line number are relative to cursor position
vim.cmd("set cc=80")                  --set an 80 column border for good coding style
vim.cmd("filetype plugin indent on")  --allow auto-indenting depending on file type
vim.cmd("syntax on")                  --syntax highlighting
vim.cmd("set mouse=a")                --enable mouse click
vim.cmd("set clipboard=unnamedplus")  --using system clipboard
vim.cmd("filetype plugin on")
vim.cmd("set cursorline")             --highlight current cursorline

vim.g.mapleader = " "

vim.wo.number = true
