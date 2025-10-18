" Basic Vim Configuration
" For users who prefer Vim as backup editor

" Enable syntax highlighting
syntax on

" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Basic settings
set number          " Show line numbers
set relativenumber  " Show relative line numbers
set cursorline      " Highlight current line
set wrap            " Wrap lines
set scrolloff=8     " Keep 8 lines visible around cursor

" Indentation
set autoindent      " Auto-indent new lines
set smartindent     " Smart indent
set tabstop=2       " Tab width
set shiftwidth=2    " Indent width
set expandtab       " Use spaces instead of tabs
set softtabstop=2   " Soft tab width

" Search
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set ignorecase      " Ignore case when searching
set smartcase       " Case-sensitive if contains uppercase

" General
set showmatch       " Show matching brackets
set ruler           " Show cursor position
set laststatus=2    # Always show status line
set wildmenu        " Enhanced command completion
set clipboard=unnamed " Use system clipboard

" Colors and appearance
set background=dark
set t_Co=256        " Enable 256 colors

" Key mappings
" Clear search highlighting with Esc
nnoremap <Esc> :nohlsearch<CR><Esc>

" Save with Ctrl+S
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto-completion for brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" TypeScript/JavaScript settings
autocmd FileType typescript,javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" Enable mouse support
set mouse=a

" Backup and swap files
set backup
set backupdir=~/.vim/backup//
set swapfile
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//

" Create backup directories if they don't exist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "", 0700)
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "", 0700)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif