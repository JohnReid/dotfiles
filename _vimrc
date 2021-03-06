" https://github.com/JohnReid/dotfiles/
"
set runtimepath=~/.vim,$VIMRUNTIME,~/.vim/after

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
syntax enable
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set nonumber                  " Don't display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

"
" Try to fix comment indents in vim.
" See
" http://stackoverflow.com/questions/354097/how-to-configure-vim-to-not-put-comments-at-the-beginning-of-lines-while-editing
"
filetype indent on
filetype plugin on


" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash
let maplocalleader="\\"       " make the local leader a backslash

" For R plugin
"let vimrplugin_screenplugin = 0
" Disable replacement of '_'- with ' <- '
let vimrplugin_assign = 0
let g:vimrplugin_insert_mode_cmds = 0
let vimrplugin_vimpager = "horizontal"
autocmd FileType r setlocal shiftwidth=2 tabstop=2
" Reload syntax highlighting with F12
" See:
" http://stackoverflow.com/questions/8674387/vim-how-to-reload-syntax-highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" For showmarks plugin
let marksCloseWhenSelected = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyz"

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>

" Open new windows below or to right of current
:set splitbelow
:set splitright

"<CR><C-w>l<C-f>:set scrollbind<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Toggle the tasklist
map <leader>td <Plug>TaskList

"
" pymode
"
" Detect virtualenv automatically
let g:pymode_virtualenv = 1
"
" Run pep8
let g:pep8_map='<leader>8'
"
" Jump to error
let g:pymode_lint_write = 0
let g:pymode_lint_jump = 1
let g:pymode_lint_ignore = "E202,E203,E221,E272,C901"
let g:pymode_mccabe_ignore = "C901"

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NERDtree
map <leader>n :NERDTreeToggle<CR>
" Close vim if only buffer left open is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Run command-t file search
map <leader>f :CommandT<CR>
" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
"set autoindent              " always set autoindenting on
"set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " always show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
" Call flake8 whenver we save a python file
" autocmd BufWritePost *.py call Flake8()




" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

" set colorcolumn=79

" Mappings for LaTeX paragraph formatting
"map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
"omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

" Set indent for LaTeX
autocmd FileType tex setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Settings for vim-latex (http://vim-latex.sourceforge.net)
set shellslash                                " Convert backward slashes to forward ones in filename references
set grepprg=grep\ -nH\ $*                     " Force grep to display file name even in single-file searches
let g:tex_flavor='latex'                      " Force .tex to mean LaTeX, not plain TeX
let g:Tex_AutoFolding = 0                     " Do not fold on opening file
let g:Tex_DefaultTargetFormat = 'pdf'         " Compile to pdf by default
" let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*' " Use pdflatex by default
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*' " Use xelatex by default
"imap <leader>{ <Plug>Tex_LeftRight

if &diff | syntax off | endif

"
" Choose a color scheme
if !has('nvim')
    " For vim-colors-solarized
    set background=light
    let g:solarized_termcolors=256
    set t_Co=256
    colorscheme solarized
    "
    " http://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
    " Set high visibility for diff mode
    let g:solarized_diffmode="high"
else
    set t_Co=256
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    colorscheme evening
    set background=dark
endif

" For Stan files
autocmd FileType stan setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"
" For vim to nvim transition
if !has('nvim')
  set ttymouse=xterm2
endif

"
" For nvim-r
let R_assign = 0  " Don't replace underscores with assignments
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_pdfviewer = "evince"

"
" For vimtex
"
" Can set the following to ignore common warnings
"let g:vimtex_quickfix_ignored_warnings = [
"            \ 'Underfull',
"            \ 'Overfull',
"            \ 'specifier changed to',
"            \ ]
" but I prefer to only open the quickfix window on errors
let g:vimtex_quickfix_open_on_warning = 0

