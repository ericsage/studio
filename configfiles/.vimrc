" ----------------------------------------------------------------------------- "
" ---V--------------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V--------------V--- "
" ---------------------- S       A     A G       E       ---------------------- "
" ---I--------------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I--------------I--- "
" ----------------------       S A     A G     G E       ---------------------- "
" ---M--------------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M--------------M--- "
" ----------------------------------------------------------------------------- "

" ------ CONTENTS ------ #
" 1. Plugins
" 2. Settings
" 3. Mappings
" 4. Functions
" 5. Plugin Matchings
" -----------------------#

" ----------------------------------------------------------------------------- "
" ------------------------------- P L U G I N S ------------------------------- "
" ----------------------------------------------------------------------------- "
" ------------------------------- AUTOINSTALLER ------------------------------- "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ------------------------------------------------------------------------------ "

call plug#begin('~/.vim/plugged')

" ------------------ TERMINALS ------------------ "
Plug 'chilicuil/conque'                      " Terminal

" --------------- UTILITY WRAPPER --------------- "
Plug 'tpope/vim-fugitive'                    " Wrap git commands
Plug 'tpope/vim-eunuch'                      " Wrap shell commands

" ------------------- CURSORS ------------------- "
Plug 'terryma/vim-multiple-cursors'          " Multiple cursors, Ctrl-n will place cursors at word repetitions
Plug 'justinmk/vim-sneak'                    " Extra vim motion commands

" ---------------- UI APPEARANCE ---------------- "
Plug 'mhinz/vim-startify'                    " Custom start screen with file picker
Plug 'mhinz/vim-signify'                     " Adds VCS markings in the gutter
Plug 'bronson/vim-trailing-whitespace'       " Marks all trailing spaces
Plug 'nathanaelkane/vim-indent-guides'       " Show fancy indent markers
Plug 'vim-airline/vim-airline'               " Customizes the status line
Plug 'vim-airline/vim-airline-themes'        " Themes for the status line
Plug 'edkolev/tmuxline.vim'                  " Match tmux to airline

" ----------------- COLORSCHEME ----------------- "
Plug 'altercation/vim-colors-solarized'      " Solarized
Plug 'morhetz/gruvbox'                       " Gruvbox

" ------------------- BROWSER ------------------- "
Plug 'scrooloose/nerdtree'                   " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'           " Git markings for nerdtree
Plug 'mbbill/undotree'                       " Undo browser
Plug 'vim-scripts/taglist.vim'               " ctag browser

" ------------------ SEARCHING ------------------ "
Plug 'Shougo/unite.vim'                      " Search engine
Plug 'Shougo/unite-outline'                  " Show buffer contents in unite
Plug 'Shougo/unite-help'                     " Unite helpfiles
Plug 'Shougo/unite-session'                  " Manage sessions with unite
Plug 'thinca/vim-unite-history'              " Allows for command search of unite
Plug 'Shougo/neomru.vim'                     " MRU plugin for unite
Plug 'Shougo/neocomplete.vim'                " Autocomplete

" ----------- SYNTAX AND LINT SUPPORT ----------- "
Plug 'scrooloose/syntastic'                  " Syntax linting for many languages
Plug 'tpope/vim-haml'                        " Syntax support for Haml, Sass, and SCSS
Plug 'vim-ruby/vim-ruby'                     " Ruby runtime bindings and compilers
Plug 'elzr/vim-json'                         " JSON syntax support
Plug 'elixir-lang/vim-elixir'                " Elixir syntax support
Plug 'fatih/vim-go'                          " Golang syntax support

call plug#end()

" ----------------------------------------------------------------------------- "
" ------------------------------ S E T T I N G S ------------------------------ "
" ----------------------------------------------------------------------------- "

" ------------------- INDENTS ------------------- "
filetype plugin indent on             " Indent using filetype files if they exist/end Vundle
set autoindent                        " Copy the indentation from the previous line
set smartindent                       " Insert an extra indent level in some cases

" ------------------ INTERFACE ------------------ "
syntax on                             " Color syntax highlighting
set shortmess=I                       " Don't show the intro message
set number                            " Line numbers
set numberwidth=1                     " Show at least one col for the line number bar
colorscheme solarized                 " Set editor colorscheme
let g:airline_theme='solarized'       " Set statusline colorscheme
set bg=dark                           " Colorscheme background color

" ----------------- STATUS LINE ----------------- "
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l " Custom status line
set ruler                             " Show line number on status line
set laststatus=2                      " Status bar will take 2 lines

" ---------------- FILE WATCHING ---------------- "
set autoread                          " Supposed to check for external changes, may not work
set autowrite                         " Write the file when you switch buffers

" ------------------- BUFFERS ------------------- "
set hidden                            " Allow change of buffer without saving first

" ------------------- CURSORS ------------------- "
set scrolloff=5                       " Keep five lines around the cursor when scrolling
set scrolljump=3                      " How many lines to scroll at a time
autocmd InsertEnter * set cursorline  " Highlight cursor line in insert
autocmd InsertLeave * set cursorline& " Remove highlight in command

" --------------- POWER  COMMANDS --------------- "
set showcmd                           " Show partial commands as they are typed
set wildmode=longest:full             " Always choose the longest match for wildmenu
set wildmenu                          " Tab completion for commands turned on

" ------------- DELIMITERS MATCHING ------------- "
set showmatch                         " Show matching objects
set complete-=i                       " Configure match mode
set matchtime=1                       " Make the match blink once

" --------------------- TAB --------------------- "
set shiftwidth=2                      " How many columns of indentation >> and << adds
set expandtab                         " Always use spaces when pressing tab
set smarttab                          " Makes tab use smart choices for indenting

"Show tabs as 4 spaces instead of the large tab character
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" ------------------- FOLDING ------------------- "
set foldlevelstart=20                 " Don't show folds on start

" ------------------- FORMATS ------------------- "
set nrformats-=octal                  " Consider numbers in Octal
set encoding=utf-8                    " Use utf-8 encoding

" --------------- KEYMAPS OPTIONS --------------- "
set ttimeout                          " Set key timeouts
set ttimeoutlen=100                   " Set key timeout time

" ------------------ SEARCHING ------------------ "
set hlsearch                          " Highlight matching searches
set ignorecase                        " Case insensitivity for searches
set smartcase                         " Match case sensitive when capital letter in a spot that makes sense

" ------------- INVISIBLE CHARACTER ------------- "
set list                              " Show invisible characters
set listchars=tab:\▸.,trail:·         " Only show tabs and trailing whitespace

" -------------------- CTAGS -------------------- "
set tags=tags;                        " Look for a ctags 'tags' file until one is found

" ------------------ CLIPBOARD ------------------ "
if has ('unnamedplus')                " This will write clipboard to unamed, +, and * buffers
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" ---------------- UTILITY FILES ---------------- "
set backupdir=~/.vim/backup           " Where to put backup files
set undodir=~/.vim/undo               " Where to put undo files
set directory=~/.vim/temp             " Where to put swap files
set backup                            " Keep backups
set undofile                          " Keep a history of undos

" ------------------ FILETYPES ------------------ "
filetype on                           " Enable filetype detection
filetype indent on                    " Enable filetype-specific indenting
filetype plugin on                    " Enable filetype-specific plugins

" ----------------------------------------------------------------------------- "
" ------------------------------ M A P P I N G S ------------------------------ "
" ----------------------------------------------------------------------------- "

" ------------------- COMMAND ------------------- "
" Use ; as :
nnoremap ; :

" ----------------- LEADER KEYS ----------------- "
" Use comma as the leader and local leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" ------------------ WINDOWING ------------------ "
" Use movement keys to jump between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ------------------ QUICKFIX ------------------ "
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" -------------------- REDOS -------------------- "
" Undo a redo with U
nnoremap U :redo<cr>

" ---------------- ABBREVIATIONS ---------------- "
" Shortcuts for viewing registers and buffers
command Reg registers
command Buf buffers

" ---------------- OPEN DRAWERS ---------------- "
" Shortcuts for viewing drawers
" Open Nerdree with Ctrl-\
nmap <silent> <C-\> :NERDTreeToggle<CR>
" Open TList with Ctrl-]
nmap <silent> <C-]> :TlistToggle<CR>

" ----------------- SEARCHING ------------------ "
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" ------------------- GOVIM -------------------- "
autocmd FileType go nmap <leader>g :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" ----------------------------------------------------------------------------- "
" ----------------------------- F U N C T I O N S ----------------------------- "
" ----------------------------------------------------------------------------- "

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" ----------------------------------------------------------------------------- "
" ----------------- P L U G I N - C U S T O M I Z A T I O N S ----------------- "
" ----------------------------------------------------------------------------- "

" ----------------- TMUX LINE ------------------ "
let g:tmuxline_powerline_separators = 0

" ------------------- GOVIM -------------------- "

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" ---------------- NEOCOMPLETE ----------------- "
let g:neocomplete#enable_at_startup = 1

" ----------------- UTILSNIPS ------------------ "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
