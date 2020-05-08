let mapleader=" "

" __Standard Bindings__

" Basic file system commands
    nnoremap <C-t> :!touch<Space>
    nnoremap <C-d> :!mkdir<Space>

" Remove trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e

" Shortcutting split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
" Enable and disable auto comment
    map <leader>c : setlocal formatoptions-=cro<CR>
    map <leader>C : setlocal formatoptions=cro<CR>
" Alias replace all to S
    nnoremap S :%s//gI<Left><Left><Left>

" Shortcut split opening
    nnoremap <leader>h :split<Space>
    nnoremap <leader>v :vsplit<Space>

" Alias write and quit to Q
    nnoremap <leader>q :wq<CR>
    nnoremap <leader>w :w<CR>

" save file as sudo when no sudo permissions
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Goyo plugin makes text more readable when writing prose:
    map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>s, 's' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Basic settings
    set termguicolors
    set encoding=utf-8
    set number relativenumber
    set noerrorbells
    set linebreak
    set showbreak=+++
    set nobackup
    set showmatch
    set noswapfile
    set hlsearch
    set smartcase
    set ignorecase
    set incsearch
    set autoindent
    set smartindent
    set smarttab
    set smartcase
    set undolevels=1000
    set backspace=indent,eol,start

" Set clipboard
    set clipboard=unnamedplus

" Set ruler
    set ruler
    set colorcolumn=80

" Tab Settings
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

" Cursor settings
    set mouse=a
    hi cursorline cterm=NONE ctermbg=238
    augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
     augroup END

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
    set updatetime=300

" Autocompletion
    set wildmode=longest,list,full

" Fix splitting
    set splitbelow splitright

" Give more space for displaying messages.
    set cmdheight=1

" Lightline
    let g:lightline={'colorscheme': 'wombat',}
    set laststatus=2
    set noshowmode

" Colorscheme
    colorscheme spacegray
    let g:spacegray_underline_search=1
    let g:spacegray_use_italics=1
    let g:spacegray_low_contrast=0
" Nnn configuration

    let g:nnn#set_default_mappings = 0
    nnoremap <leader>n :NnnPicker '%:p:h'<CR>
    let g:nnn#layout={ 'left': '~20%' } " Opens it to the left
    let g:nnn#command = 'nnn -e'
    let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

call plug#begin('~/.config/nvim/plugged')
    Plug 'mcchrish/nnn.vim'
    Plug 'junegunn/goyo.vim'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tomtom/tcomment_vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
call plug#end()
