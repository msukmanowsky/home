" Mike Sukmanowsky's .vimrc file

" general config ==============================================================
set number                      " show line numbers
set backspace=indent,eol,start  " allow backspace in insert mode
set history=700                 " :cmdline history
set undolevels=700              " lots of erasers for lots of pencils
set showcmd                     " show incomplete commands on statusbar
set showmode                    " show the current mode on statusbar
set cursorline                  " cursor can be hard to spot
set gcr=a:blinkon0              " disable cursor blink
set visualbell                  " no sounds
set autoread                    " autoreload files changed outside of vim
set autowrite

" show extra whitespace as well (must be before colorscheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256                    " number of colors to use
color wombat256mod

set tw=79                       " terminal width of 80 (python)
set colorcolumn=80              " give ourselves a nice line on col 80
highlight ColorColumn ctermbg=233

syntax on                       " syntax highlighting

let mapleader = ","             " instead of default '|'

set noswapfile                  " disable swap files
set nobackup                    " disable backup files
set nowb                        " no backups before writing

set mouse=a                     " enable mouse on all modes

" indentdation ================================================================
set autoindent
set smartindent
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
vnoremap < <gv  " prevent vim from entering normal mode after indenting once
vnoremap > >gv  " prevent vim from entering normal mode after indenting once

set nowrap                      " don't wrap on load
set fo-=t                       " don't wrap while typing

filetype plugin indent on       " match indentation rules to file type

" scrolling ===================================================================
set scrolloff=8                 " start scrolling when 8 lines away from margin
" set sidescrolloff=15
" set sidescroll=1

" windows and tabs ============================================================
" Create a vertical or horizontal split, then jump to new buffer
noremap <Leader>v :vsp<c-M><c-W><C-W><CR>
noremap <Leader>h :split<c-M><c-W><c-w><CR>

" Bind Ctrl+<movement> keys to move around windows instead of Ctrl+w then
" <movement>
map <c-h> <c-w>w
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easier movement between tabs
map <Leader>p <esc>:tabprevious<CR>
map <Leader>n <esc>:tabnext<CR>

" search ======================================================================
set hlsearch                    " highlight all matches of prev pattern
set incsearch                   " show matches while typing
set ignorecase                  " case insensitive matching
set smartcase                   " if search contains uppercase, ignore ignorecase


" event hooks =================================================================
" Automatically reload .vimrc
autocmd! BufWritePost .vimrc source %
" remove all trailing whitespace on a write
autocmd BufWritePre * :%s/\s+$//e

"" clipboard
"set pastetoggle=<F2>    " see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
"set clipboard=unnamed   " supposed to make clipboard work on mac OS

" plugins =====================================================================
" pathogen
call pathogen#infect()

" NERDtree
noremap <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vim-flake8
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" autocmd BufWritePost *.py call Flake8() " check PEP8 when saving

" vim-powerline
set laststatus=2

" ctrl-p
let g:ctrlp_max_height=30           " some room to breathe
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" jedi-vim
let g:jedi#related_names_command = "<Leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
set nofoldenable
