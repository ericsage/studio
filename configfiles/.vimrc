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
" 5. Plugin Customizations
" 6. Colorscheme
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

" --------------- UTILITY WRAPPER --------------- "
Plug 'tpope/vim-fugitive'                    " Wrap git commands
Plug 'tpope/vim-eunuch'                      " Wrap shell commands

" ------------------- EDITING ------------------- "
Plug 'scrooloose/nerdcommenter'              " Edit/create comments
Plug 'tpope/vim-surround'                    " Edit/create wrapping text

" ------------------- CURSORS ------------------- "
Plug 'justinmk/vim-sneak'                    " Extra vim motion commands
Plug 'terryma/vim-multiple-cursors'          " Multiple cursors, Ctrl-n will place cursors at word repetitions
Plug 'farmergreg/vim-lastplace'              " Reopen files at the last edit position

" ---------------- UI APPEARANCE ---------------- "
Plug 'mhinz/vim-startify'                    " Custom start screen with file picker
Plug 'mhinz/vim-signify'                     " Adds VCS markings in the gutter
Plug 'bronson/vim-trailing-whitespace'       " Marks and removes all trailing spaces
Plug 'nathanaelkane/vim-indent-guides'       " Show fancy indent markers
Plug 'vim-airline/vim-airline'               " Customizes the status line
Plug 'vim-airline/vim-airline-themes'        " Themes for the status line

" ----------------- COLORSCHEME ----------------- "
Plug 'altercation/vim-colors-solarized'      " Solarized
Plug 'morhetz/gruvbox'                       " Gruvbox

" ------------------- BROWSER ------------------- "
Plug 'scrooloose/nerdtree'                   " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'           " Git markings for nerdtree
Plug 'majutsushi/tagbar'                     " Tag browser
Plug 'mbbill/undotree'                       " Undo browser
Plug 'vim-scripts/taglist.vim'               " ctag browser

" ------------ COMPLETION AND SEARCH ------------ "
Plug 'Shougo/neocomplete.vim'                " Autocomplete
Plug 'Shougo/neoinclude.vim'                 " Include header info in autocomplete
Plug 'SirVer/ultisnips'                      " Snippet support
Plug 'honza/vim-snippets'                    " Snippet library
Plug 'junegunn/fzf.vim'                      " Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" ----------- SYNTAX AND LINT SUPPORT ----------- "
Plug 'w0rp/ale'                              " Async linting for many languages
Plug 'elzr/vim-json'                         " JSON syntax support
Plug 'pangloss/vim-javascript'               " Better Javascript syntax support
Plug 'mxw/vim-jsx'                           " JSX support for Javascript
Plug 'elixir-lang/vim-elixir'                " Elixir IDE support
Plug 'fatih/vim-go'                          " Golang IDE support
Plug 'davidhalter/jedi-vim'                  " Python IDE support
Plug 'rust-lang/rust.vim'                    " Rust IDE support

call plug#end()

" ----------------------------------------------------------------------------- "
" ------------------------------ S E T T I N G S ------------------------------ "
" ----------------------------------------------------------------------------- "

" ---------------- COMPATABILITY ---------------- "
 set nocompatible                     " Turn vi compatability mode off

" ------------------- INDENTS ------------------- "
filetype plugin indent on             " Indent using filetype files if they exist/end Vundle
set autoindent                        " Copy the indentation from the previous line
set smartindent                       " Insert an extra indent level in some cases

" ------------------ INTERFACE ------------------ "
syntax on                             " Display syntax highlighting
set shortmess=I                       " Hide the intro message
set number                            " Show line numbers
set numberwidth=2                     " Use at least two columns to display line numbers
highlight clear SignColumn            " Make the sign column use default coloring

" ----------------- STATUS LINE ----------------- "
set ruler                             " Show line number on status line
set laststatus=2                      " Use two rows to display the status line

" ---------------- FILE WATCHING ---------------- "
set autoread                          " Reread the file when an external change is detected
set autowrite                         " Write the file when a buffer switch occurs

" ------------------ WINDOWING ------------------ "
set splitbelow                        " Create horizontal splits below the current window
set splitright                        " Create vertical splits to the right of the current window

" ------------------- CURSORS ------------------- "
set scrolloff=5                       " The number of lines kept above and below the cursor
set scrolljump=5                      " The number of lines to scroll at a time
autocmd InsertEnter * set cursorline  " Highlight line with cursor in insert mode
autocmd InsertLeave * set cursorline& " Remove cursor line highlight in command mode

" ------------------- COMMANDS ------------------ "
set showcmd                           " Show partial commands as they are typed
set wildmenu                          " Show a completion menu for commands with Tab
set wildmode=longest:full             " Always choose the longest match for the completion menu

" ------------- DELIMITERS MATCHING ------------- "
set showmatch                         " Briefly move the cursor to the matching brace when insertings a brace
set matchtime=1                       " Move the cursor to the matched braced for a tenth of a second

" ----------------- INDENTATION ----------------- "
set shiftwidth=2                      " Insert two spaces of indentation with reindent (>> <<)
set expandtab                         " Insert spaces when the Tab key is pressed
set tabstop=2                         " Insert two spaces when the Tab key is pressed

" ------------------- FOLDING ------------------- "
set foldmethod=syntax                 " Sets folds using the folding method defined in the current filetype syntax file
set foldlevelstart=20                 " Make all folds closed when a file is opened

" ------------------- ENCODING ------------------ "
set encoding=utf-8                    " Set vim's default encoding to utf-8
set fileencoding=utf-8                " Set the default encoding of files to utf-8

" --------------- KEYMAPS OPTIONS --------------- "
set ttimeout                          " Time out on key codes
set ttimeoutlen=100                   " The time in milliseconds that is waited for a key code sequence to complete

" ------------------ SEARCHING ------------------ "
set hlsearch                          " Highlight all matches for a previous search pattern
set incsearch                         " Search as characters are entered
set ignorecase                        " Ignore the case of normal letters when searching
set smartcase                         " Ignore case when the pattern contains lowercase letters only
set complete-=i                       " When completing a name (<C-n> <C-p>), sna current and included file for matches
set completeopt=menu                  " Show a menu when completing a name when there is more than one match.

" ---------------- UTILITY FILES ---------------- "
set backup                            " Create a backup of any opened files, overwriting any old backups
set backupdir=~/.vim/backup//         " Backup files location, use complete path as backup file name (//)
set directory=~/.vim/tmp//            " Swap files location, use complete path as swap file name (//)
set undodir=~/.vim/undo//             " Undo files location, use complete path as undo file name (//)
set undofile                          " Keep a history of undos

" ------------------ FILETYPES ------------------ "
filetype on                           " Enable filetype detection
filetype indent on                    " Enable filetype-specific indenting
filetype plugin on                    " Enable filetype-specific plugins

" ------------------- GOLANG -------------------- "
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

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

" -------------------- REDOS -------------------- "
" Undo a redo with U
nnoremap U :redo<cr>

" ---------------- ABBREVIATIONS ---------------- "
" Shortcuts for viewing registers and buffers
command Reg registers
command Buf buffers

" -------------------- PASTE -------------------- "
nnoremap <leader>p :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

" ---------------- OPEN DRAWERS ----------------- "
" Open Nerdree with Ctrl-\
nmap <silent> <C-\> :NERDTreeToggle<CR>
" Open TList with Ctrl-]
nmap <silent> <C-]> :TlistToggle<CR>

" ------------------- FINDING ------------------- "
"Search files in git
nnoremap <C-f> :GFiles<CR>
"Search all files
nnoremap <leader>fa :Files<CR>
"Search lines in all open buffers
nnoremap <leader>fl :Lines<CR>
"Search command history
nnoremap <leader>fc :History:<CR>
"Search search history
nnoremap <leader>fs :History/<CR>
"Search key mappings
nnoremap <leader>fm :Maps<CR>

" ------------------ SEARCHING ------------------ "
"Clear the search highlighting
nnoremap <C-s> :nohlsearch<cr>

" ----------------------------------------------------------------------------- "
" ----------------- P L U G I N   C U S T O M I Z A T I O N S ----------------- "
" ----------------------------------------------------------------------------- "

" ----------------- SOLARIZED ------------------ "
let g:solarized_termtrans=1

" ------------------ AIRLINE ------------------- "
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ---------------- NEOCOMPLETE ----------------- "
let g:neocomplete#enable_at_startup = 1

" ------------------- JEDI --------------------- "
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

" -------------------- ALE --------------------- "
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 1000

" ----------------- UTILSNIPS ------------------ "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>pt"
let g:UltiSnipsJumpBackwardTrigger="<leader>nt"

" ------------------ VIM-GO -------------------- "
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" Automatically show the type info of the token under the cusor
let g:go_auto_type_info = 1
" When adding tags to structs, use snackcase for each tag
let g:go_addtags_transform = "snakecase"
" Use goimports instead of fmt
let g:go_fmt_command = "goimports"
" Run the metalinter on save
let g:go_metalinter_autosave = 1
" Highlight tokens with the same name
let g:go_auto_sameids = 1
" Set syntax tokens to color
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
" Calls `go run` for the current main package
au FileType go nmap <C-g> <Plug>(go-run)
" Calls `go test` for the current main package
au FileType go nmap <C-t> <Plug>(go-test)
" Calls `go build` for the current main package
au FileType go nmap <C-c> <Plug>(go-build)
" Calls `go install` for the current main package
au FileType go nmap <C-i> <Plug>(go-install)
" Rename the identifier under the cursor to the desired new name
au FileType go nmap <C-r> <Plug>(go-rename)
" Alternates between the implementation and test code in the current window
au FileType go nmap <C-a> <Plug>(go-alternate-edit)
" Calls go test -coverprofile-temp.out or clears the annotation like a toggle
au FileType go nmap <C-m> <Plug>(go-coverage-toggle)
" Show the interfaces that the type under the cursor implements
au FileType go nmap <Leader>m <Plug>(go-implements)
" Calls `go test -run '...'` for the test function immediate to cursor
au FileType go nmap <Leader>t <Plug>(go-test-func)
" Shows type information for the word under the cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Show path from callgraph root to selected function
au FileType go nmap <Leader>cs <Plug>(go-callstack)
" Show the call targets for the type under the cursor
au FileType go nmap <leader>ce <Plug>(go-callees)
" Show possible callers of the selected function
au FileType go nmap <leader>cr <Plug>(go-callers)
" Show send/receive corresponding to selected channel op
au FileType go nmap <leader>ch <Plug>(go-channelpeers)
" Shows the relevant GoDoc for the word under the cursor in a split window
au FileType go nmap <leader>do <Plug>(go-doc-vertical)
" Goto decleration/definition. Results are shown in a split window.
au FileType go nmap <leader>de <Plug>(go-def-vertical)

" ------------------- VIM-RUST --------------------- "
let g:rustfmt_command = "rustup run nightly rustfmt"
let g:rustfmt_autosave = 1

" ----------------------------------------------------------------------------- "
" --------------------------- C O L O R S C H E M E --------------------------- "
" ----------------------------------------------------------------------------- "

set background=dark                   " Set the colorscheme background color
colorscheme solarized                 " Set a colorscheme
highlight CursorLine ctermbg=White    " Set the cursorline background to white

" ----------------------------------------------------------------------------- "
