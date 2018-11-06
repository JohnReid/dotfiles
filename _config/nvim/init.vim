"
" John's vim configuration
" https://github.com/JohnReid/dotfiles/
"


" ==========================================================
" Plugins
" ==========================================================
call plug#begin('~/.config/nvim/plugged')
"
" Filetypes
"
Plug 'https://github.com/bfredl/nvim-ipy.git'
" Plug 'https://github.com/JohnReid/nvim-ipy.git'
Plug 'git@github.com:nvie/vim-flake8.git'
Plug 'git@github.com:tell-k/vim-autopep8.git'
" Plug 'https://github.com/klen/python-mode.git'
" Plug 'https://github.com/ivanov/vim-ipython.git'
" Plug 'git@github.com:vim-scripts/Vim-R-plugin.git'
Plug 'https://github.com/jalvesaq/Nvim-R.git'
Plug 'https://github.com/lervag/vimtex.git'
Plug 'https://github.com/vim-pandoc/vim-pandoc.git'
Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax.git'
Plug 'https://github.com/vim-pandoc/vim-rmarkdown.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/maverickg/stan.vim.git'
"
" tpope
"
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'git://github.com/tpope/vim-unimpaired.git'
Plug 'git://github.com/tpope/vim-commentary.git'
Plug 'git://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-surround.git'
"
" Miscellaneous
"
Plug 'vim-syntastic/syntastic'  " For lintr R syntax integration
Plug 'timakro/vim-searchant'
Plug 'https://github.com/wincent/Command-T.git'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/vim-scripts/TaskList.vim.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ervandew/screen.git'
Plug 'https://github.com/ervandew/supertab.git'
" Plug 'git@github.com:vim-scripts/AutoComplPop.git'
" Plug 'git@github.com:eparreno/vim-l9.git'
Plug 'https://github.com/mhartington/oceanic-next.git'
Plug 'https://github.com/chrisbra/csv.vim.git'
" Plug 'https://github.com/Shougo/deoplete.nvim.git'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'  " Required by ncm2
"
" Color schemes
"
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
Plug 'haishanh/night-owl.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'tjammer/blayu.vim'
Plug 'Jimeno0/vim-chito'
"
" Following 4 for snipmate
"
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/honza/vim-snippets.git'
"
" Add plugins to &runtimepath
call plug#end()


" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
syntax enable
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
let mapleader=","             " change the leader to be a comma vs slash
let maplocalleader="\\"       " make the local leader a backslash
"
" Reload Vimrc
" map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


" ==========================================================
" Messages, Info, Status, Appearance
" ==========================================================
set nonumber                " Don't display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set background=light        " We are using light background in vim
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
" Highlight column
set colorcolumn=119
" Choose a color scheme
set termguicolors
colorscheme solarized
" Reload syntax highlighting with F12
" From: http://stackoverflow.com/questions/8674387/vim-how-to-reload-syntax-highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>


" ==========================================================
" Moving Around/Editing
" ==========================================================
" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0
" Refresh syntax from top
nmap <silent><F5> :syntax sync fromstart<CR>
"<CR><C-w>l<C-f>:set scrollbind<CR>
" Toggle the tasklist
map <leader>td <Plug>TaskList
" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>
" Open NERDtree
map <leader>n :NERDTreeToggle<CR>
" Close vim if only buffer left open is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>
" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>
" Not sure what this is...
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
" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>
" Load the Gundo window
map <leader>g :GundoToggle<CR>
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
set tabstop=2               " <tab> inserts 2 spaces
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
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
" Paste from clipboard
map <leader>p "+p
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
map <leader>f :CommandT<CR>
" Ack searching
nmap <leader>a <Esc>:Ack!
set grepprg=ack             " replace the default grep program with ack
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
" Quit window on <leader>q
nnoremap <leader>q :q<CR>
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>
" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Damian Conway's Die Blinkënmatchen: highlight matches
" From: https://vi.stackexchange.com/a/2770
" nnoremap <silent> n n:call HLNext(0.1)<cr>
" nnoremap <silent> N N:call HLNext(0.1)<cr>
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
" Diff
" ==========================================================
set diffopt+=iwhite          " Ignore whitespace
"
" Change highlighting in diff??
if &diff | syntax off | endif


" ==========================================================
" Syntastic
" ==========================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ==========================================================
" Showmarks plugin
" ==========================================================
let marksCloseWhenSelected = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyz"


" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %
"
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
"
let g:acp_completeoptPreview=1


" ==========================================================
" Python
" ==========================================================
"
" nvim-ipy
" Ask nvim-ipy not to make its own mappings
let g:nvim_ipy_perform_mappings = 0
" Set up our own mappings
au FileType python map  <buffer> <silent> <LocalLeader>l   <Plug>(IPy-Run)
au FileType python map  <buffer> <silent> <LocalLeader>p   <Plug>(IPy-RunCell)
au FileType python map  <buffer> <silent> <LocalLeader>a   <Plug>(IPy-RunAll)
au FileType python imap <buffer> <silent> <LocalLeader>f   <Plug>(IPy-Complete)
au FileType python map  <buffer> <silent> <LocalLeader>h   <Plug>(IPy-WordObjInfo)
au FileType python map  <buffer> <silent> <LocalLeader>i   <Plug>(IPy-Interrupt)
au FileType python map  <buffer> <silent> <LocalLeader>k   <Plug>(IPy-Terminate)
" Empty lines define start and end of cells
let g:ipy_celldef = '^$'
"
" Run pep8
let g:pep8_map='<leader>8'
let g:autopep8_indent_size=2
"
" pymode
" Detect virtualenv automatically
let g:pymode_virtualenv = 1
"
" Jump to error
let g:pymode_lint_write = 0
let g:pymode_lint_jump = 1
let g:pymode_lint_ignore = "E202,E203,E221,E272,C901"
let g:pymode_mccabe_ignore = "C901"
"
" run py.tests
au FileType python nmap <silent><LocalLeader>tf <Esc>:Pytest file<CR>
au FileType python nmap <silent><LocalLeader>tc <Esc>:Pytest class<CR>
au FileType python nmap <silent><LocalLeader>tm <Esc>:Pytest method<CR>
au FileType python nmap <silent><LocalLeader>tn <Esc>:Pytest next<CR>
au FileType python nmap <silent><LocalLeader>tp <Esc>:Pytest previous<CR>
au FileType python nmap <silent><LocalLeader>te <Esc>:Pytest error<CR>
"
" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with equalprg=autopep8\ -
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 1
" Call flake8 whenver we save a python file
" autocmd BufWritePost *.py call Flake8()
"
" Indent Python in the Google way.
" From: https://github.com/google/styleguide/blob/gh-pages/google_python_style.vim
au Filetype python setlocal indentexpr=GetGooglePythonIndent(v:lnum)
au Filetype python let s:maxoff = 50 " maximum number of lines to look backwards.
au Filetype python let pyindent_nested_paren="&sw*2"
au Filetype python let pyindent_open_paren="&sw*2"
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
"
" Figure out the system Python for Neovim.
" See https://github.com/neovim/neovim/issues/1887
"
if exists("$VIRTUAL_ENV")
    let g:python_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), '\n', '', 'g')
else
    let g:python_host_prog=substitute(system("which python3"), '\n', '', 'g')
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
autocmd FileType r,rmd setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType rmd setlocal foldcolumn=0
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
" LaTeX
autocmd FileType tex setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 wrap
" Can set the following to ignore common warnings
"let g:vimtex_quickfix_ignored_warnings = [
"            \ 'Underfull',
"            \ 'Overfull',
"            \ 'specifier changed to',
"            \ ]
" but I prefer to only open the quickfix window on errors
let g:vimtex_quickfix_open_on_warning = 0
"
" from: https://github.com/lervag/vimtex/issues/835 to enable Synctex
let g:vimtex_compiler_progname = "nvr"
let g:vimtex_view_method = "zathura"
let g:vimtex_latexmk_progname = "nvr"
let g:tex_flavor = 'latex'
"
" Use Zathura
let g:vimtex_view_general_viewer = 'zathura'
"
" Use synctex to synchronise vim cursor and the PDF viewer
let g:vimtex_latexmk_options = '-synctex=1'
"
" " Settings for vim-latex (http://vim-latex.sourceforge.net)
" set shellslash                                " Convert backward slashes to forward ones in filename references
" set grepprg=grep\ -nH\ $*                     " Force grep to display file name even in single-file searches
" let g:tex_flavor='latex'                      " Force .tex to mean LaTeX, not plain TeX
" let g:Tex_AutoFolding = 0                     " Do not fold on opening file
" let g:Tex_DefaultTargetFormat = 'pdf'         " Compile to pdf by default
" " let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*' " Use pdflatex by default
" let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*' " Use xelatex by default
" "imap <leader>{ <Plug>Tex_LeftRight
"
" Mappings for LaTeX paragraph formatting
"map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
"omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>


" ===========================================================
" Mako/HTML
" ============================================================
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html


" ===========================================================
" Stan
" ===========================================================
autocmd FileType stan setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2


" ===========================================================
" XML
" ===========================================================
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax


" ==========================================================
" Pandoc
" ==========================================================
" let g:pandoc#modules#disabled = ["folding"]
"set foldcolumn=0
let g:vim_markdown_folding_level = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
