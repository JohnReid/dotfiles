"
" John's vim configuration
" https://github.com/JohnReid/dotfiles/
"

" ==========================================================
" Plugins
" ==========================================================
call plug#begin('~/.config/nvim/plugged')
"
" Text objects
"
Plug 'kana/vim-textobj-user'               " Required for vim-textobj-latex and vim-textobj-python
Plug 'kana/vim-textobj-entire'             " Required for vim-textobj-latex and vim-textobj-python
Plug 'michaeljsmith/vim-indent-object'     " for indentation text objects
Plug 'JohnReid/vim-textobj-latex'          " LaTeX text objects
" Plug '/home/john/src/vim-textobj-latex'  " LaTeX text objects
Plug 'bps/vim-textobj-python'
"
" Filetypes
"
Plug 'JohnReid/vim-shebang'                " Detect filetypes from shebang lines
Plug 'jalvesaq/Nvim-R'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'maverickg/stan.vim'
Plug 'chrisbra/csv.vim'
"
" tpope
"
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-scriptease'
"
" Files
"
Plug 'scrooloose/nerdtree'
Plug 'will133/vim-dirdiff'  " diff on directories
"
" Git / gists
"
Plug 'mattn/webapi-vim'  " For gists
Plug 'mattn/gist-vim'  " For gists
Plug 'airblade/vim-gitgutter'  " show modified git chunks
"
" Highlighting
"
Plug 'vim-syntastic/syntastic'  " For lintr R syntax integration
Plug 'timakro/vim-searchant'  " Improved search highlighting
"
" Miscellaneous
"
Plug 'machakann/vim-highlightedyank'  " Make the yanked region apparent
Plug 'urbainvaes/vim-ripple'  " Send code to a REPL
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'godlygeek/tabular'  " Align text
Plug 'sjl/gundo.vim'
"
" Completion managers / refactoring
"
Plug 'roxma/nvim-yarp'  " Required by ncm2
Plug 'ncm2/ncm2'
"
" Fuzzy finder
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" Distraction-free writing
"
Plug 'junegunn/goyo.vim'  " Distraction-free writing
Plug 'junegunn/limelight.vim'  " Hyperfocus writing
"
" Color schemes
"
Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'tjammer/blayu.vim'
Plug 'Jimeno0/vim-chito'
Plug 'junegunn/seoul256.vim'
"
" Snippets
"
Plug 'MarcWeber/vim-addon-mw-utils'  " Required for vim-snipmate
Plug 'tomtom/tlib_vim'               " Required for vim-snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
"
" Add plugins to &runtimepath
call plug#end()


" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
syntax enable
" Reload syntax highlighting with F12
" From: http://stackoverflow.com/questions/8674387/vim-how-to-reload-syntax-highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" Refresh syntax from top
nmap <silent><F5> :syntax sync fromstart<CR>
" Try to fix comment indents in vim.
" See
" http://stackoverflow.com/questions/354097/how-to-configure-vim-to-not-put-comments-at-the-beginning-of-lines-while-editing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
filetype indent on
filetype plugin on
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
"
" Shortcuts
set nocompatible              " Don't be compatible with vi
let mapleader=" "             " change the leader to be a space
let maplocalleader=","        " make the local leader a comma
"
" Set encoding as recommended by: https://danielmiessler.com/study/vim/
set encoding=utf-8
"
" Use GB English for spell checking when it is turned on
set spelllang=en_gb
set spellfile=~/.config/nvim/spell/en.utf-8.add
"
" Vimrc
"
" Edit and source vim configuration
:nnoremap <Leader>ev :split $MYVIMRC<CR>
:nnoremap <Leader>sv :source $MYVIMRC<CR>:echo 'vim configuration ($MYVIMRC) reloaded'<CR>
"
" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>
"
" To work with :terminal (see :help terminal-input)
" Use jk to exit terminal-mode:
:tnoremap jk <C-\><C-n>
" To simulate |i_CTRL-R| in terminal-mode:
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" Keep terminal open when buffer hidden
augroup terminal
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

" ==========================================================
" Messages, Info, Status, Appearance
" ==========================================================
set number relativenumber   " Display current and relative line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set title                   " show title in console title bar
set ls=2                    " always show status line
set noerrorbells
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
set colorcolumn=119         " Highlight column
set termguicolors           " Try to use 24 bit colors
set background=dark         " We are using dark background in vim
" colorscheme solarized       " Note we should set tmux to use same colour scheme
" colorscheme gruvbox
" colorscheme night-owl
colorscheme seoul256


" ==========================================================
" Moving Around/Editing
" ==========================================================
" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0
"<CR><C-w>l<C-f>:set scrollbind<CR>
" Map jk to exit insert mode. From https://danielmiessler.com/study/vim/
" and 'Learn vimscript the hard way'
inoremap jk <ESC>
inoremap JK <ESC>
" open/close the quickfix window
nmap <Leader>co :copen<CR>
nmap <Leader>cc :cclose<CR>
" open/close the location list
nmap <Leader>lo :lopen<CR>
nmap <Leader>lc :lclose<CR>
"
" Fzf
"
" From: https://github.com/euclio/vimrc/ and https://github.com/zenbro/dotfiles
nnoremap <silent> <Leader>ff :Files<cr>
nnoremap <silent> <Leader>fg :Rg<cr>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>f/ :History/<CR>
nnoremap <silent> <Leader>f: :History:<CR>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
"
" NERDtree
"
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']    " ignore some files
augroup NERDtree
  " Have NERDtree open automatically when nvim opens on a directory
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  " Close vim if only buffer left open is NERDtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
" Not sure what this is...
fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu
"
" Splits
"
nmap <Leader>sb :call SplitScroll()<CR>
" Open new windows below or to right of current
:set splitbelow
:set splitright
" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too (<C-O> makes next cmd
" happen as if in command mode)
imap <C-W> <C-O><C-W>
" Load the Gundo window
map <Leader>g :GundoToggle<CR>
set ruler                   " show the cursor position all the time
set cursorline              " show the cursor line
set cursorcolumn            " show the cursor column
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
"set autoindent              " always set autoindenting on
"set smartindent             " use smart indent if there is no indent file
set tabstop=2               " <tab> inserts 2 spaces
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
"
" Folding
"
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
" don't outdent hashes
inoremap # #
augroup preview
  autocmd!
  " close preview window automatically when we move around
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END
" Paste from clipboard
map <Leader>p "+p
"
" For toggling paste mode
" From: http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" ==========================================================
" Reading/Writing
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
" sudo write this
cmap W! w !sudo tee % >/dev/null
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.


" ==========================================================
" Searching and Patterns
" ==========================================================
" Run command-t file search
set grepprg=ack             " replace the default grep program with ack
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
" Quit window on <Leader>q
nnoremap <Leader>q :q<CR>
" hide matches on <Leader>space
nnoremap <Leader><space> :nohlsearch<CR>
" Remove trailing whitespace on <Leader>S
nnoremap <Leader>S :%s/\s\+$//<CR>:let @/=''<CR>
" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Damian Conway's Die Blinkënmatchen: highlight matches
" From: https://vi.stackexchange.com/a/2770
" nnoremap <silent> n n:call HLNext(0.1)<CR>
" nnoremap <silent> N N:call HLNext(0.1)<CR>
" function! HLNext (blinktime)
"   let target_pat = '\c\%#'.@/
"   let ring = matchadd('ErrorMsg', target_pat, 101)
"   redraw
"   exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"   call matchdelete(ring)
"   redraw
" endfunction


" ==========================================================
" Insert completion
" ==========================================================
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window
"
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**


" ==========================================================
" Tags
" ==========================================================
" Look for tags up to root: https://stackoverflow.com/a/741486/959926
set tags=./tags;/


" ==========================================================
" Syntastic
" ==========================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
map <F6> :SyntasticToggleMode <CR>
map <F7> :SyntasticCheck <CR>


" ==========================================================
" Gist
" ==========================================================
let g:gist_edit_with_buffers = 1
let g:gist_list_vsplit = 1


" ==========================================================
" airblade/gitgutter config from:
" https://jakobgm.com/posts/vim/git-integration/#i-class-fab-fa-github-i-airblade-vim-gitgutter-i-class-fab-fa-github-i
" ==========================================================
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" simple look
let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)


" ==========================================================
" Goyo / Limelight
" ==========================================================
augroup goyo
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END


" ==========================================================
" Showmarks plugin
" ==========================================================
let marksCloseWhenSelected = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyz"


" ==========================================================
" Javascript
" ==========================================================
augroup javascript
  autocmd!
  autocmd BufRead *.js set makeprg=jslint\ %
augroup END
"
" Use tab to scroll through autocomplete menus
" augroup autocomplete
"   autocmd!
"   autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"   autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" augroup END
"
let g:acp_completeoptPreview=1


" ==========================================================
" Send to window
" ==========================================================
" let g:sendtowindow_use_defaults=0  " turn off default mappings
" nmap <Leader>l <Plug>SendRight
" xmap <Leader>l <Plug>SendRightV
" nmap <Leader>h <Plug>SendLeft
" xmap <Leader>h <Plug>SendLeftV
" nmap <Leader>k <Plug>SendUp
" xmap <Leader>k <Plug>SendUpV
" nmap <Leader>j <Plug>SendDown
" xmap <Leader>j <Plug>SendDownV
" nmap <Leader>d <Plug>(SendDown)<c-d>
" nmap <Leader><CR> <Plug>SendDown<CR>
" nmap <Leader>p <Plug>SendDownip


" ==========================================================
" Vim ripple
" ==========================================================
let newline = "\<cr>"
let g:ripple_enable_mappings = 0
let g:ripple_winpos = 'below'
nmap <LocalLeader>ro <Plug>(ripple_open_repl)
vmap <LocalLeader>rs <Plug>(ripple_send_selection)
nmap <LocalLeader>rm <Plug>(ripple_send_motion)
nmap <LocalLeader>rp <Plug>(ripple_send_previous)
nmap <LocalLeader>a <Plug>(ripple_send_motion)ae
nmap <LocalLeader>p <Plug>(ripple_send_motion)ap
nmap <LocalLeader>l <Plug>(ripple_send_motion)_
nmap <LocalLeader><CR> :call ripple#command(0, 0, newline)<CR>
nmap <LocalLeader>w <Plug>(ripple_send_motion)iw
" nmap <LocalLeader>w <Plug>(ripple_send_motion)iw


" ==========================================================
" Python
" ==========================================================
"
" Set up python interpreter for neovim
function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction
let hostname = Chomp(system('hostname'))
if hostname == "BPEU318.local"
  let g:python3_host_prog = '/Users/johnreid/anaconda3/envs/neovim/bin/python'
elseif hostname == 'Ubuntu-XPS-15'
  let g:python_host_prog = '/home/john/miniconda3/envs/Python2/bin/python'
endif
"
" Syntastic
let g:syntastic_python_checkers = ["flake8"]
"
" nvim-ipy
" Ask nvim-ipy not to make its own mappings
let g:nvim_ipy_perform_mappings = 0
" Set up our own mappings
" augroup IPy
"   autocmd!
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>l   <Plug>(IPy-Run)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>w   <Plug>(IPy-Word)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>o   <Plug>(IPy-RunOp)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>r   <Plug>(IPy-RunRegister)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>c   <Plug>(IPy-RunCell)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>a   <Plug>(IPy-RunAll)
"   autocmd FileType python imap <buffer> <silent> <LocalLeader>f   <Plug>(IPy-Complete)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>h   <Plug>(IPy-WordObjInfo)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>i   <Plug>(IPy-Interrupt)
"   autocmd FileType python map  <buffer> <silent> <LocalLeader>k   <Plug>(IPy-Terminate)
" augroup END
" Empty lines define start and end of cells
let g:ipy_celldef = '^$'
" set syntax=python in IPython buffer automatically: https://github.com/bfredl/nvim-ipy/issues/43
let g:ipy_set_ft = 1
"
" Run pep8
let g:pep8_map='<Leader>8'
let g:autopep8_indent_size=4
"
" pymode
" Detect virtualenv automatically
let g:pymode_virtualenv = 1
"
" Jump to error
let g:pymode_lint_write = 0
let g:pymode_lint_jump = 1
let g:pymode_lint_ignore = "E111,E202,E203,E221,E272,C901"
let g:pymode_mccabe_ignore = "C901"
"
" run py.tests
" augroup pytests
"   autocmd!
"   autocmd FileType python nmap <silent><LocalLeader>tf <Esc>:Pytest file<CR>
"   autocmd FileType python nmap <silent><LocalLeader>tc <Esc>:Pytest class<CR>
"   autocmd FileType python nmap <silent><LocalLeader>tm <Esc>:Pytest method<CR>
"   autocmd FileType python nmap <silent><LocalLeader>tn <Esc>:Pytest next<CR>
"   autocmd FileType python nmap <silent><LocalLeader>tp <Esc>:Pytest previous<CR>
"   autocmd FileType python nmap <silent><LocalLeader>te <Esc>:Pytest error<CR>
" augroup END
"
augroup python
  autocmd!
  "autocmd BufRead *.py compiler nose
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with equalprg=autopep8\ -
  autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END
"
" Does pyflakes use the quickfix window?
let g:pyflakes_use_quickfix = 1
" Call flake8 whenver we save a python file - this only works when vim-flake8
" plugin is loaded.
" autocmd BufWritePost *.py call Flake8()
"
" Indent Python in the Google way.
" From: https://github.com/google/styleguide/blob/gh-pages/google_python_style.vim
augroup pythonindent
  autocmd!
  autocmd Filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
  autocmd Filetype python let s:maxoff = 50  " maximum number of lines to look backwards.
  autocmd Filetype python let pyindent_nested_paren="&sw"
  autocmd Filetype python let pyindent_open_paren="&sw"
  autocmd Filetype python let pyindent_continue="&sw"
  autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup END
"
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction
"
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
"
" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


" ==========================================================
" R
" ==========================================================
"
" Lintr
let g:syntastic_enable_r_lintr_checker = 0
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_r_lintr_linters = "with_defaults(commas_linter = NULL, commented_code_linter = NULL, line_length_linter(120))"
"
" For tags to work with R
" From: http://tinyheero.github.io/2017/05/13/r-vim-ctags.html
"
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" let vimrplugin_screenplugin = 0
" Disable replacement of '_'- with ' <- '
" let vimrplugin_assign = 0
" let g:vimrplugin_insert_mode_cmds = 0
" let vimrplugin_vimpager = "horizontal"
augroup R
  autocmd!
  autocmd FileType r,rmd setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType rmd setlocal foldcolumn=0
augroup END
"
" For nvim-r
let R_assign = 0  " Don't replace underscores with assignments
" let R_in_buffer = 1
let R_applescript = 0
" let R_tmux_split = 0
let R_pdfviewer = "zathura"
let R_nvimpager = "tab"
let rout_follow_colorscheme = 1  " Highlight R output with the current colorscheme


" ==========================================================
" LaTeX
" ==========================================================
"
augroup LaTeX
  autocmd!
  autocmd FileType tex setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 wrap
  autocmd FileType tex setlocal spell
  " autocmd FileType tex colorscheme night-owl
  " Colour TeX templates like TeX
  autocmd BufReadPost *.tex.template setlocal filetype=tex
  " Turn off error highlighting in templates
  autocmd BufReadPost *.tex.template highlight! link Error Normal
  " Add a custom surround
  autocmd BufReadPost *.tex.template let b:surround_45 = "\\TEXT{ \"\r\" }"
augroup END
" Can set the following to ignore common warnings
"let g:vimtex_quickfix_ignored_warnings = [
"            \ 'Underfull',
"            \ 'Overfull',
"            \ 'specifier changed to',
"            \ ]
" but I prefer to only open the quickfix window on errors
let g:vimtex_quickfix_open_on_warning = 0
" More informative chktex messages
let g:syntastic_tex_chktex_args = '-v0'
let g:syntastic_tex_chktex_showmsgs = 1
let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }
" from: https://github.com/lervag/vimtex/issues/835 to enable Synctex
let g:vimtex_compiler_progname = "nvr"
let g:vimtex_view_method = "zathura"
let g:tex_flavor = 'latex'
" Use Zathura
let g:vimtex_view_general_viewer = 'zathura'
"
" " Settings for vim-latex (http://vim-latex.sourceforge.net)
" set shellslash                                " Convert backward slashes to forward ones in filename references
" set grepprg=grep\ -nH\ $*                     " Force grep to display file name even in single-file searches
" let g:tex_flavor='latex'                      " Force .tex to mean LaTeX, not plain TeX
" let g:Tex_AutoFolding = 0                     " Do not fold on opening file
" let g:Tex_DefaultTargetFormat = 'pdf'         " Compile to pdf by default
" " let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*' " Use pdflatex by default
" let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*' " Use xelatex by default
" "imap <Leader>{ <Plug>Tex_LeftRight
"
" Mappings for LaTeX paragraph formatting
"map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
"omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>


" ===========================================================
" Mako/HTML
" ============================================================
augroup HTML
  autocmd!
  autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
augroup END


" ===========================================================
" Stan
" ===========================================================
augroup Stan
  autocmd!
  autocmd FileType stan setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END


" ===========================================================
" XML
" ===========================================================
let g:xml_syntax_folding=1
augroup XML
  autocmd!
  autocmd FileType xml setlocal foldmethod=syntax
augroup END


" ==========================================================
" vim-markdown
" ==========================================================
let g:tex_conceal = ""
let g:vim_markdown_folding_level = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
"
" Preview markdown from: https://stackoverflow.com/a/20799071/959926
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <LocalLeader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <LocalLeader>pp :RunSilent xdg-open /tmp/vim-pandoc-out.pdf<CR>

" Add '  # noqa: [flake8 code]' to end of current location (assuming it is
" a flake8 error)
" Trying advice: https://vi.stackexchange.com/a/27904/19227
nnoremap <LocalLeader>f8i :lopen<CR>$yi[<CR>A  # noqa: <esc>p :lclose<CR>


" ==========================================================
" Diff
" ==========================================================
set diffopt+=iwhite          " Ignore whitespace
"
" Changing the highlight colours should be done after setting the colorscheme
" Change highlighting in diff??
if &diff | syntax off | endif
" Diff highlighting colours: https://github.com/tpope/vim-fugitive/issues/1501#issuecomment-602141438
" hi DiffChange guibg=#5f005f
" hi DiffAdd    guibg=#00005f
" hi DiffRemove guibg=#005f5f
" hi DiffText   guibg=#5f0000
" if &t_Co == 256
"   hi DiffChange ctermbg=53
"   hi DiffAdd    ctermbg=17
"   hi DiffDelete ctermbg=23
"   hi DiffText   ctermbg=52
" endif
