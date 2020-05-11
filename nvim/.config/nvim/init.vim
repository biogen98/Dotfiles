"==========================================================================
"==========================================================================
"===                        (_)                                         ===
"===            _ __ __   __ _  _ __ ___   _ __  ___                    ===
"===           | '_  \\ \ / /| || '_ ` _ \ | '__|/ __|                  ===
"===           | | | |\ V / | || | | | | || |  | (__                    ===
"===           |_| |_| \_/  |_||_| |_| |_||_|   \___|                   ===
"===                                                                    ===
"==========================================================================
"==========================================================================


let mapleader=" "

" __Standard Bindings__

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
set formatoptions-=cro

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
map <leader>g :Goyo \| set linebreak<CR>

" Spell-check set to <leader>s, 's' for 'orthography':
set spelllang=en_us,nl
map <leader>en : setlocal spell! spelllang=en_gb<CR>
map <leader>du : setlocal spell! spelllang=nl<CR>

" Terminal configuration
tnoremap <Esc> <C-\><C-n>:q!<CR>
" Window resizing mappings /*{{{*/
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Basic settings
set encoding=utf-8
set number relativenumber
set noerrorbells
set linebreak
set showbreak=+++
set nobackup
set noswapfile
set smartcase
set autoindent
set smartindent
set smartcase
set undolevels=1000
set backspace=indent,eol,start
set showmatch
set hidden
set pumheight=10

" Set search options
set ignorecase
set hlsearch
set incsearch

" Set clipboard
set clipboard=unnamedplus

" Set ruler
set ruler
set colorcolumn=80

" Tab Settings
set smarttab
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

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Give more space for displaying messages.
set cmdheight=2

" Lightline
let g:lightline={'colorscheme': 'wombat',}
set laststatus=2
set noshowmode

" Colorscheme
set termguicolors
colorscheme spacegray
let g:spacegray_underline_search=1
let g:spacegray_use_italics=1
let g:spacegray_low_contrast=0

" Nerdtree configuration
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "right"

" Ctrlp
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode = 'ra'

" Easymotion configuration
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader><Leader>l  <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" COC configuration
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Startify setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_custom_header = [
            \ '                                 ',
            \ '            __                   ',
            \ '    __  __ /\_\    ___ ___       ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\    ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \    ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\   ',
            \ '     \/__/    \/_/\/_/\/_/\/_/   ',
            \ ]

" Plug install plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'lilydjwg/colorizer'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/limelight.vim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/goyo.vim'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tomtom/tcomment_vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'sheerun/vim-polyglot'
    Plug 'ryanoasis/vim-devicons'
    Plug 'davidhalter/jedi-vim'
call plug#end()
