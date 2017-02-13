"echo "runtime my-vimrc/.vimrc" > ~/.vimrc
"
"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'mileszs/ack.vim'

Plugin 'python-mode/python-mode'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'qpkorr/vim-bufkill'
"Markdown
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'rhysd/vim-gfm-syntax'
"pip3 install grip
"Not needed as we can use grip as a server: Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'

Plugin 'Tagbar'
Plugin 'fholgado/minibufexpl.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=128 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

au BufNewFile,BufRead *.js,*.html,*.css 
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
let mapleader=","
map <leader>gg  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>

let g:ycm_python_binary_path="python3"

let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
"let g:nerdtree_tabs_autoclose=0

set nu

let python_highlight_all=1
syntax on

"show ailine
set laststatus=2

" Drop NERDTree Tabs settings at the end of the config file "
" Open file via NERDTree Tabs, hot key: \t "
nmap <silent> <leader>n :NERDTreeTabsToggle<CR>
nmap <silent> <leader>N :NERDTreeFind<CR>
nmap <silent> <leader>t :TagbarToggle<CR>


nmap <silent> <leader>q :BD<CR>
nmap <silent> <leader>m :MBEToggle<CR>

let g:vim_markdown_folding_disabled = 1

let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
autocmd BufRead,BufNew,BufNewFile *.md setlocal ft=markdown.gfm
let g:markdown_fenced_languages = ['sh', 'cpp', 'ruby', 'json', 'python']

set nofoldenable
let g:pymode_python = 'python3'
" " Override go-to.definition key shortcut to Ctrl-]
" let g:pymode_rope_goto_definition_bind = "<leader>e"
" "" Override run current python file key shortcut to Ctrl-Shift-e
" "let g:pymode_run_bind = "<leader>e"
" " Override view python doc key shortcut to Ctrl-Shift-d
" let g:pymode_doc_bind = "<leader>r"
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_completion = 0
let g:pymode_virtualenv = 1
let g:pymode_options_max_line_length = 128
let g:pymode_rope_autoimport=1

au FileType python setlocal formatprg=autopep8\ -
au FileType python nmap <leader>f :PymodeLintAuto<CR>

set wildmenu

let g:ackprg = 'ag --vimgrep --smart-case'

