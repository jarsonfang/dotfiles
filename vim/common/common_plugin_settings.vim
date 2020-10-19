"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help airline)
"
set laststatus=2 " Always show the status line

if &background == "dark"
    let g:airline_theme='deus'
    " let g:airline_theme='molokai'
else
    let g:airline_theme='solarized'
endif

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

"let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"                                                     *airline-customization*
"variable names                default contents
"------------------------------------------------------------------------------
"let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"let g:airline_section_b       (hunks, branch)
"let g:airline_section_c       (bufferline or filename)
"let g:airline_section_gutter  (readonly, csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
"let g:airline_section_y       (fileencoding, fileformat)
"let g:airline_section_z       (percentage, line number, column number)
"let g:airline_section_error   (ycm_error_count, syntastic, eclim)
"let g:airline_section_warning (ycm_warning_count, whitespace)

"let g:airline#extensions#default#layout = [
"    \ [ 'a', 'b', 'c' ],
"    \ [ 'x', 'y', 'z', 'error', 'warning' ]
"    \ ]
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline-tmuxline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline.conf"

" #H    Hostname of local host
" #h    Hostname of local host without the domain name
" #F    Current window flag
" #I    Current window index
" #S    Session name
" #W    Current window name
" #(shell-command)  First line of the command's output
let g:tmuxline_preset = {
            \'a'       : '#S',
            \'win'     : '#I #W',
            \'cwin'    : '#I #W',
            \'y'       : '%H:%M',
            \'z'       : '%Y/%m/%d %a',
            \'options' : {'status-justify' : 'left'}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
" au FileType c,cpp,objc,objcpp call rainbow#load()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help indentline)
"
let g:indentLine_concealcursor = ''
let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_fileType = ['python']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help easymotion)
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Jump to anywhere till before {char}
" `t{char}{label}`
map t <Plug>(easymotion-bd-t)
" or {char}{char}
" `t{char}{char}{label}`
"map t <Plug>(easymotion-bd-t2)

" n-character search motion
map / <Plug>(easymotion-sn)
map ? <Plug>(easymotion-sn)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help trailing-whitespace)
"
map <Leader><space> :FixWhitespace<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help tagbar)
"
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
nmap <Leader>tb :TagbarToggle<CR>
nmap <Leader>tl :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help NERDTree)
"
" Global commands
" :NERDTree [<start-directory> | <bookmark>], help :NERDTree to see more detail
nmap <Leader>n :NERDTree<Space>
"nmap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\~$', '\.pyc$', '\.pyo$', '\.obj$', '\.o$',
            \ '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>nt <Plug>NERDTreeTabsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help NERDCommenter)
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" The whole lines to be commented out when there is no multipart delimiters,
" but the EXACT text that was selected to be commented out if there IS multipart delimiters.
let g:NERDCommentWholeLinesInVMode=2

" The following key mappings are provided by default (there is also a menu
" with items corresponding to all the mappings below):

" [count]<Leader>cc NERDComComment
" Comment out the current line or text selected in visual mode.

" [count]<Leader>cu NERDComUncommentLine
" Uncomments the selected line(s).

" [count]<Leader>c<space> NERDComToggleComment
" Toggles the comment state of the selected line(s). If the topmost selected
" line is commented, all selected lines are uncommented and vice versa.
map <Leader>ct <Plug>NERDCommenterToggle

" [count]<Leader>cm NERDComMinimalComment
" Comments the given lines using only one set of multipart delimiters.

" [count]<Leader>ci NERDComInvertComment
" Toggles the comment state of the selected line(s) individually.

" [count]<Leader>cs NERDComSexyComment
" Comments out the selected lines ``sexily''

" <Leader>c$ NERDComEOLComment
" Comments the current line from the cursor to the end of line.

" <Leader>ca NERDComAltDelim
" Switches to the alternative set of delimiters.
nmap <Leader>c<space> <Plug>NERDCommenterAltDelims

" [count]<Leader>cy NERDComYankComment
" Same as <Leader>cc except that the commented line(s) are yanked first.

" <Leader>cA NERDComAppendComment
" Adds comment delimiters to the end of line and goes into insert mode between them.
nmap <Leader>ca <Plug>NERDCommenterAppend

" NERDComInsertComment
" Adds comment delimiters at the current cursor position and inserts between.
" Disabled by default.
imap <Leader>ci <Plug>NERDCommenterInsert

" [count]<Leader>cn NERDComNestedComment
" Same as <Leader>cc but forces nesting.
map <Leader>cN <Plug>NERDCommenterNested

" [count]<Leader>cl
" [count]<Leader>cb    NERDComAlignedComment
" Same as NERDComComment except that the delimiters are aligned down the
" left side (<Leader>cl) or both sides (<Leader>cb).
map <Leader>cL <Plug>NERDCommenterAlignLeft
"map <Leader>cB <Plug>NERDCommenterAlignBoth

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Alternate Files quickly (a.vim)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " :A switches to the header file corresponding to the current file being edited (or vise versa)
 nmap <Leader>a :A<CR>
 " :AS splits and switches
 nmap <Leader>as :AS<CR>
 " :AV vertical splits and switches
 nmap <Leader>av :AV<CR>
 " :AT new tab and switches
 nmap <Leader>at :AT<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Showmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help showmarks)
"
" Enable ShowMarks
let showmarks_enable = 1

" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"

" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

"The following mappings are setup by default:
"  <Leader>mt   - Toggles ShowMarks on and off.
"  <Leader>ma   - Clears all marks in the current buffer.
"  <Leader>mm   - Places the next available mark on the current lineo
nmap <Leader>mc :ShowMarksClearMark<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markbrowser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>mb :MarksBrowser<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Task list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>td <Plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessionman
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>sl :SessionList<CR>
nmap <Leader>ss :SessionSave<CR>
nmap <Leader>sc :SessionClose<CR>

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help surround)
"
" Normal mode
"  ds  - delete a surrounding
"  cs  - change a surrounding
"  ys  - add a surrounding (Note: "ys" for "you surround")
"  yss - add a surrounding to the whole line
"
"  Visual mode
"  S - in visual mode, add a surrounding but place text on new line + indent it

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help fugitive)
"
nmap <Leader>gs :Git<CR>
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gl :Gclog<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gv :Gvdiffsplit<CR>
nmap <Leader>gh :Ghdiffsplit<CR>

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help gitgutter)
"
"To change the hunk-jumping maps (defaults shown):
"  nmap [c <Plug>GitGutterPrevHunk
"  nmap ]c <Plug>GitGutterNextHunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"To change the hunk-staging/undoing/previewing maps (defaults shown):
"  nmap <Leader>hs <Plug>GitGutterStageHunk
"  nmap <Leader>hu <Plug>GitGutterUndoHunk
"  nmap <Leader>hp <Plug>GitGutterPreviewHunk
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1

" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0

" preview the result in a popup window
let g:Lf_PreviewInPopup = 1

let g:Lf_UseCache = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" mannually generate gtags by using `Leaderf gtags --update` command
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_GtagsAutoUpdate = 1

" By default, gtags supports C, C++, Yacc, Java, PHP and Assembly
" programming language. If you want to support other programming languages,
" you can install the pygments package by command `pip install pygments` and
" set this option as "native-pygments".
" Default value is "default".
let g:Lf_Gtagslabel = 'native-pygments'

" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg', '.ccls-cache'],
            \ 'file': ['*.sw?','~$*','*.bak','*.o','*.py[co]']
            \}

let g:Lf_MruWildIgnore = {
            \ 'dir': ['.svn','.git','.hg', '.ccls-cache'],
            \ 'file': ['*.sw?','~$*','*.bak','*.o','*.py[co]']
            \}

let g:Lf_MruFileExclude = ['*.so', '*.a']

let g:Lf_StlSeparator = { 'left': '', 'right': '' }

let g:Lf_RootMarkers = ['.git', '.hg', '.svn']
let g:Lf_WorkingDirectoryMode = 'Ac'

" Command       Description
" <Esc>         quit from LeaderF
" <C-R>         switch between fuzzy search mode and regex mode
" <C-F>         switch between full path search mode and name only search mode
" <C-J>         move the cursor downward in the result window
" <C-K>         move the cursor upward in the result window
" <C-P>         preview the result
" <Home>        move the cursor to the begin of the prompt
" <End>         move the cursor to the end of the prompt
" <Up> / <Down> recall last/next input pattern from history

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help vim-markdown)
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 6

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

"let g:vim_markdown_emphasis_multiline = 0
"let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

" Commands
" - ':TableFormat': Format the table under the cursor
" - ':Toc': create a quickfix vertical window navigable table of contents with the headers.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_conceal = 1
let g:rust_conceal_pub = 1
let g:rust_conceal_mod_path = 1

let g:rustfmt_autosave = 1
" let g:rustfmt_autosave_if_config_present = 1

let g:rustfmt_fail_silently = 0
" let g:rustfmt_options = ''

let g:rust_recommended_style = 1

let g:syntastic_rust_checkers = ['cargo']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual (see :help pymode)
"

