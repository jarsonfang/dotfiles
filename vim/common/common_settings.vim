"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" Sets how many lines of history VIM has to remember
set history=50

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" When searching try to be smart about cases
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" do incremental searching
set incsearch

" A buffer becomes hidden when it is abandoned
set hidden

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" With a map leader it's possible to do extra key combinations
" like <Leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Syntax and colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Workaround with tmux terminal
if exists('$TMUX') && !has('nvim')
  set term=screen-256color
endif

if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
else
    set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("syntax")
  syntax on
endif

if &t_Co > 2 || has("gui_running")
  syntax enable
"  set hlsearch
endif

set conceallevel=2

if &background == "light"
    colorscheme solarized8
else
    colorscheme deus
    " colorscheme molokai
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Always show current position
set ruler

" Show line number
set number

" display incomplete commands
set showcmd

" Height of the command bar
" Give more space for displaying messages.
set cmdheight=2

" Highlight the cursor line
set cursorline

" Set borderline (or reference line)
set colorcolumn=80 " or set cc=80, use set cc= to unset the option
"hi ColorColumn ctermbg=black

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab & Spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand tab with spaces
"set expandtab
"set tabstop=4
"set shiftwidth=4
set et ts=4 sw=4

set smarttab
set softtabstop=-1
nmap <Leader>rt :retab!<CR>

" Show tabs and trails
set list listchars=tab:→·,trail:·

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting C style text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help usr_30)
"
" When you have code that is badly formatted, or you inserted and deleted lines,
" you need to re-indent the lines.  The "=" operator does this.  The simplest
" form is:
"
"   ==
"
" This indents the current line.  Like with all operators, there are three ways
" to use it.  In Visual mode "=" indents the selected lines.  A useful text
" object is "a{".  This selects the current {} block.  Thus, to re-indent the
" code block the cursor is in:
"
"   =a{
"
" I you have really badly indented code, you can re-indent the whole file with:
"
"   gg=G
"
" However, don't do this in files that have been carefully indented manually.
" The automatic indenting does a good job, but in some situations you might want
" to overrule it.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set nobackup

" Set to auto read when a file is changed from the outside
set autoread

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Ignore compiled and backup files
set wildignore=*.o,*.pyc,*~

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" For all text files load abbreviation settings
autocmd Filetype text source ~/.vim/scripts/abbrevs.vim

" Settins below:
" 'et' for expandtab, 'sta' for smarttab,
" 'sw' for shiftwidth, 'sts' for softtabstop

" For python files tab & indent
autocmd FileType python setlocal et sta sw=4 sts=4

" For markdown files tab & indent
autocmd FileType markdown setlocal et sta sw=4 sts=4

" load skel.c for C source files
" autocmd BufNewFile *.[ch] 0read ~/.vim/scripts/skel.c

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Highlighting for Qt’s .pro and .pri files
au BufNewFile,BufRead *.pro set filetype=make
au BufNewFile,BufRead *.pri set filetype=make

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Remap VIM 0 to first non-blank character
"map 0 ^

" Window moving cursor
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

" Window resizing
nmap <C-h> <C-W><
nmap <C-j> <C-W>-
nmap <C-k> <C-W>+
nmap <C-l> <C-W>>

" Window moving around
" Exchange current window with next one
nmap <C-x> <C-W>x

"<C-W> K Move the current window to be at the very top
"<C-W> J Move the current window to be at the very bottom
"<C-W> H Move the current window to be at the far left
"<C-W> L Move the current window to be at the far right

" Useful mappings for managing tabs
nmap <Leader>ta :tabnew<CR>
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>to :tabonly<CR>
nmap <Leader>tc :tabclose<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nmap <Leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
nmap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Edit file
nmap <Leader>e :edit<Space>

" Save file
nmap <Leader>w :w!<CR>
nmap <Leader>wa :wa!<CR>
nmap <Leader>wq :wq!<CR>

" Close or hide window
nmap <Leader>h :hide<CR>
nmap <Leader>c :close<CR>

" Quit window
nmap <Leader>q :q!<CR>
nmap <Leader>qa :qa!<CR>

" Split window
nmap <Leader>hs :split<CR>

" Split window vertical
nmap <Leader>vs :vsplit<CR>

" Toggle paste mode on and off
nmap <Leader>p :setlocal paste!<CR>

" Buffer operations
nmap <Leader>ls :ls<CR>
" the :ls command is the same as :buffers
nmap <Leader>b  :buffer<Space>
nmap <Leader>bd :bdelete<CR>
nnoremap <C-N>  :bnext<CR>
nnoremap <C-P>  :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast edit vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"Fast reloading of the .vimrc
if has('nvim')
    nmap <Leader>sv :source ~/.vim/nvimrc<CR>
else
    nmap <Leader>sv :source ~/.vimrc<CR>
endif

"Fast editing of .vimrc
if has('nvim')
    nmap <Leader>ev :call SwitchToBuf("~/.vim/nvimrc")<CR>
else
    nmap <Leader>ev :call SwitchToBuf("~/.vimrc")<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man page
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>m :Man<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help cscope)
"
" Excute commands below in the project root dir to generate cscope database:
"   find -type f > cscope.files
"   cscope -bq
" Or
"   cscope -bRq
" Generated files: cscope.files, cscope.in.out, cscope.out, cscope.po.out.
"
if has("cscope")
    set csprg=/usr/bin/cscope
    set csqf=s-,c-,d-,i-,t-,e-
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

" 0 or s: Find this C symbol
nmap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
" 1 or g: Find this definition
" nmap <Leader>fd :cs find g <C-R>=expand("<cword>")<CR><CR>
" 2 or d: Find functions called by this function
nmap <Leader>fc :cs find d <C-R>=expand("<cword>")<CR><CR>
" 3 or c: Find functions calling this function
nmap <Leader>fr :cs find c <C-R>=expand("<cword>")<CR><CR>
" 4 or t: Find this text string
nmap <Leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
" 6 or e: Find this egrep pattern
nmap <Leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
" 7 or f: Find this file
"nmap <Leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>fg :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 8 or i: Find files #including this file
nmap <Leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help quickfix)
"
" List all errors.
nmap <Leader>cl :clist!<CR>
" Display the next error in the list
nmap <Leader>cn :cnext<CR>
" Display the previous error in the list
nmap <Leader>cp :cprevious<CR>
" Open the quickfix window when there are recognized errors
nmap <Leader>cw :cw 10<CR>
" Close the quickfix window
nmap <Leader>cq :cclose<CR>

