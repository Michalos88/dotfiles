" long live vim
set encoding=utf-8
set nocompatible

" package manager
call plug#begin()

" core plugins
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/taglist.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'raimondi/delimitMate'
Plug 'gregsexton/gitv'
Plug 'godlygeek/tabular'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" color scheme
Plug 'brendonrapp/smyck-vim'

" syntax files
Plug 'dense-analysis/ale'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less'

call plug#end()

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>a :Ag
nnoremap <leader>b :TlistToggle<CR>
nnoremap <leader>c :TComment<CR>
nnoremap <leader>C :TCommentBlock<CR>
vnoremap <leader>c :TComment<CR>
vnoremap <leader>C :TCommentBlock<CR>
nnoremap <leader>nt :tabnew<CR>:CtrlP<CR>
nnoremap <leader>l :NERDTreeTabsToggle<CR>
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>ed :tabnew ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
nnoremap <leader>tgt :set cursorcolumn! cursorline!<CR>
nnoremap <leader>RC :.-1read ~/code/snippets/container.js<CR>G<ESC>dd
nnoremap <leader>Rc :.-1read ~/code/snippets/component.js<CR>G<ESC>dd

" use standard javascript syntax checking
let g:ale_linters = {
      \   'javascript': ['standard'],
      \   'python': ['ruff']
      \}
let g:ale_sign_error = '●'
let g:ale_sign_error = '.'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-b> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" taglist config
let g:Tlist_Use_Right_Window = 1

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" snippet config
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" FZF (replacement for CtrlP/Command-T)
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" syntax highlighting and auto-indentation
syntax on
filetype indent on
filetype plugin on
inoremap # X<C-H>#
set ai
set si
set nu

" omg folding is the worst
set nofoldenable

" omg automatic comment insertion is the worst
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" expand tabs to 2 spaces
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" auto save buffers whenever you lose focus
au FocusLost * silent! wa

" auto save buffers when you switch context
set autowriteall

" buffer navigation
nnoremap <silent> <tab> <C-i>
nnoremap <silent> <S-tab> <C-o>

" leave showtabline as default (for now)
set showtabline=1

" searching options
set incsearch
set ignorecase
set smartcase
set hlsearch

" escape search highliting by hitting return
nnoremap <CR> :noh<CR><CR>

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" font options
set background=dark
set t_Co=256
colorscheme smyck

" keep at least 5 lines below the cursor
set scrolloff=5

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" enable mouse support
set mouse=a

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" word wrapping
set wrap
set linebreak
set nolist

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" close buffer when tab is closed
set nohidden

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ; is better than :
nnoremap ; :
nnoremap : ;

" kj/jk is better than ctrl-c or esc - also autosave when leaving insert mode
inoremap kj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>
inoremap jj <Esc>

" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" more logical vertical navigation
nnoremap <silent> k gk
nnoremap <silent> j gj

" make copy/pasting nice
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=r
    set nonu
  else
    set mouse=a
    set nu
  endif
endfunction
nnoremap <leader>m :call ToggleMouse()<CR>

" Map Clip Board to General Clip Board
set clipboard=unnamed
" call vundle#config#require(g:bundles)
