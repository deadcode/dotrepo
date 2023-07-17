" Maintainer:	Sandeep Dahiya<sdahiya@sdahiya.hss.hns.com>
" Last change:	2000 Nov 13
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"
"      List of custom commands
"       <F2> - last buffer
"       <F3> - make
"       <F4> - cn
"       <F5> - cN
"       <F6> - cl
"       <F8> - reindent
"       {    - {}
"       "    - ""
"       (    - ()
"   0-9<C-]> - cs find 0-9 <current word>
"     <S-F3> - print file header
"     <S-F4> - print function Header
"     Alt+c  - smart commenting of current line
"     Alt+C  - smart uncommenting of current line
"       <F9> - print name of current function
"      <F10> - print definition of current function
"      <F11> - goto start of this function 
"      <F12> - goto end of this function
"behave mswin
"source $VIMRUNTIME/mswin.vim

"set diffexpr=MyDiff()
"function! MyDiff()
"  let opt = ''
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  silent execute '!D:\Vim\vim61\diff -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
"endfunction
set t_ti=7[?47h
set t_te=[2J[?47l8
"set t_ti=[?7l
"set t_te=[?7h
set t_kb=
fixdel
set nocompatible
set selectmode=mouse

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Plugin 'altercation/vim-colors-solarized'
Plugin 'The-NERD-tree'
"Plugin 'ack.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nerdtree-ack'
Plugin 'Solarized'
Plugin 'Syntastic'
Plugin 'hari-rangarajan/CCTree'
"Plugin 'CCTree'
Plugin 'fugitive.vim'
Plugin 'Tagbar'
Plugin 'OmniCppComplete'
Plugin 'unimpaired.vim'
"Plugin 'minibufexpl.vim'
"Plugin 'Powerline'
"Plugin 'Conque-Shell'
Plugin 'lrvick/Conque-Shell'
Plugin 'tmux-plugins/vim-tmux-focus-events'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Indent-Guides'
Plugin 'ctrlp.vim'
Plugin 'tComment'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/promptline.vim'
Bundle 'edkolev/tmuxline.vim'
"Plugin 'Valloric/YouCompleteMe'
Bundle 'junegunn/vim-easy-align'
Plugin 'IndexedSearch'
if v:version >= 802
    Plugin 'voldikss/vim-floaterm'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:CCTreeSplitProgOption = '-l'

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 5
silent! nmap <F7> :IndentGuidesToggle<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
silent! nmap <F4> :SyntasticToggleMode<CR>
silent! nnoremap <F5> :NERDTreeToggle<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" Tagbar
let g:tagbar_show_linenumbers = 2
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 0
let g:tagbar_sort = 0
let g:tagbar_show_visibility = 1
nmap <F3> :TagbarToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"let g:promptline_preset = 'full' "clear / full / powerlineclone : .vim/bundle/promptline.vim/autoload/promptline/presets
let g:promptline_preset = {
            \'a' : [ promptline#slices#host(), promptline#slices#battery({'threshold': 100})],
            \'b' : [ promptline#slices#user(), promptline#slices#jobs() ],
            \'c' : [ promptline#slices#cwd() ],
            \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
            \'warn' : [ promptline#slices#last_exit_code() ] }
let g:promptline_theme = 'airline' "airline / airline_insert / airline_visual / jelly / lightline / lightline_insert / lightline_visual / powerlineclone / vim_statusline_[123]
let g:promptline_powerline_symbols = 1
"call PromptlineSnapshot('~/.shell_prompt.sh', 'airline')
" sections (a, b, c, x, y, z, warn) are optional
"let g:promptline_preset = {
"        \'a' : [ promptline#slices#host() ],
"        \'b' : [ promptline#slices#user() ],
"        \'c' : [ promptline#slices#cwd() ],
"        \'y' : [ promptline#slices#vcs_branch() ],
"        \'warn' : [ promptline#slices#last_exit_code() ]}
" available slices:
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
" promptline#slices#conda_env() - display which conda env is active (empty is none)
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`
" allow backspacing over everything in insert mode

let g:tmuxline_preset = 'full' " crosshair / full / minimal / nightly_fox / powerline / righteous / tmux :.vim/bundle/tmuxline.vim/autoload/tmuxline/presets/
let g:tmuxline_powerline_separators = 1
let g:tmuxline_theme = 'airline_insert'
let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_preset = {
"      \'a'    : '#S',
"      \'b'    : '#W',
"      \'c'    : '#H',
"      \'win'  : '#I #W',
"      \'cwin' : '#I #W',
"      \'x'    : '%a',
"      \'y'    : '#W %R',
"      \'z'    : '#H'}

"call Tmuxline('airline')

" Floaterm config
if v:version >= 802
let g:floaterm_width=0.8
let g:floaterm_height=0.8

let g:floaterm_keymap_new='<Leader>ft'
let g:floaterm_keymap_prev='<Leader>ftp'
let g:floaterm_keymap_next='<Leader>ftn'
let g:floaterm_keymap_first='<Leader>ftf'
let g:floaterm_keymap_last='<Leader>ftl'
let g:floaterm_keymap_hide='<Leader>fth'
let g:floaterm_keymap_show='<Leader>fts'
let g:floaterm_keymap_kill='<Leader>ftk'
let g:floaterm_keymap_toggle='<Leader>ftt'
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

let g:floaterm_opener="tabe"
silent! nnoremap <F5> :FloatermNew --width=0.8 --height=0.8 broot<CR>

" Set floaterm window's background to black
hi Floaterm guibg=black
" " Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan ctermbg=9 ctermfg=9
endif

set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set cmdheight=1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Map Up/Down arrows to move Graphical lines to avoid nasty jumps on long lines
nmap k gk
vmap k gk
nmap <Up> gk
vmap <Up> gk
imap <Up> <C-o>gk
nmap j gj
vmap j gj
nmap <Down> gj
vmap <Down> gj
imap <Down> <C-o>gj

" When wraping show a line break indication
set linebreak
set showbreak=- "digraph <C-K>+>>

" When scrolling long lines/paragraphs show partial lines too
set display+=lastline

" Show 2 lines at bottom, 1 for status and 1 for cmd mode
set laststatus=2

" What to show in the status line
"set statusline=%<%f%m%r%h%w\ [Format=%{&ff}]\ [Type=%Y]\ [Ascii=\%03.3b]\ [Hex=\%02.2B]\ %=%-14.(%l,%c%V%)\ [%p%%\ of\ %L]
"set statusline=%<%1*%f%*%2*%m%r%h%w%*%(\ [%{&ff}]%)%(\ %y%)\ [Ascii=\%03.3b,Hex=\%02.2B]\ %=%(%l,%c%V%)\ [%p%%\ of\ %L]
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=3 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

"""au InsertEnter * call InsertStatuslineColor(v:insertmode)
"""au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
"""
"""" default the statusline to green when entering Vim
"""hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
"""
"""" Formats the statusline
"""set statusline=%<
"""set statusline+=%f " file name
"""set statusline+=%m      "modified flag
"""set statusline+=\ %{tagbar#currenttag('[%s]\ ','fs')} "Tagbar function prototype
"""set statusline+=\ %r      "read only flag
"""set statusline+=\ [%{&ff}, "file format
"""set statusline+=\ %y,      "filetype
"""set statusline+=\ %{strlen(&fenc)?&fenc:'none'}, "file encoding
"""set statusline+=\ Ascii=\%03.3b,Hex=\%02.2B]
""""set statusline+=%h      "help file flag
"""" Puts in the current git status
""""if count(g:pathogen_disabled, 'Fugitive') < 1   
""""    set statusline+=%{fugitive#statusline()}
""""endif
"""" Puts in syntastic warnings
""""if count(g:pathogen_disabled, 'Syntastic') < 1  
""""    set statusline+=%#warningmsg#
""""    set statusline+=%{SyntasticStatuslineFlag()}
""""    set statusline+=%*
""""endif
"""set statusline+=\ %=                        " align left
"""set statusline+=%(%l,%c%V%)
"""set statusline+=\ [%p%%\ of\ %L]            " line X of Y [percent of file]
"""set statusline+=\ [Buf:%n]\                     " Buffer number
"""set statusline+=\ %{fugitive#statusline()}\  " Git Branch
"""set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
"""set statusline+=%*
"""
""""set highlight+=s:BruceStatusLine
""""highlight BruceStatusLine term=bold,reverse cterm=reverse ctermbg=black ctermfg=red gui=bold,reverse
"""highlight BruceStatusLine term=bold,reverse cterm=bold,reverse ctermbg=black ctermfg=yellow gui=bold,reverse
highlight User1 term=bold,reverse cterm=bold,reverse ctermbg=white ctermfg=red gui=bold,reverse
highlight User2 term=bold,reverse cterm=reverse ctermbg=red ctermfg=green gui=bold,reverse

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" Do all custom settings below this line

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  set backupdir=~/tmp
endif
set viminfo=!,'20,\"500,n~/.viminfo	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set viminfo+=!
set sessionoptions+=globals

if has("autocmd")
  autocmd FileType c,cpp  set formatoptions=tcroql cindent comments=s1:/**,m:**,ex:*/,s1:/*,mb:*,ex:*/,:// textwidth=79 wrap cino=(1s,l1
  "autocmd BufEnter *.c,*.cpp,*.h exec "normal 80\<C-W>|"| set wrap
  "autocmd BufEnter *.c,*.cpp,*.h exec "normal 80\<C-W>|"
  "autocmd BufLeave *.c,*.cpp,*.h set nowrap
  autocmd BufEnter *.pc set ft=c
  autocmd FileType c,cpp,pyton,javascript,json set foldmethod=syntax
  autocmd VimEnter * if exists(":CCTreeLoadXRefDBFromDisk") | if filereadable("cscope.cctree") | echo "Loading cscope.cctree" | exe "CCTreeLoadXRefDBFromDisk cscope.cctree" | endif | endif

  " Launch NerdTree when launching vim without a file
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  if v:version >= 700
      au BufLeave * let b:winview = winsaveview()
      au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
  endif
endif

set magic
set aw
set showmode
set sm
set sw=4
set ts=4
"set fo=croq
"Insert <ts> spaces instead of Tabs
set expandtab
"set softtabstop
set showcmd	"Display incomplete commands
set incsearch	"Do incremental search
if has("vertsplit")
    set splitright
endif

"Abbreviations
ab #i # include
ab #d # define
ab #l # else
ab #e # endif
ab #u # undef

"
"Key Mappings
"

" Previous Buffer
nmap <F2> :b#<CR>
imap <F2> <ESC>:b#<CR>i

" Make commands
"nmap <F3> :make<CR>
"imap <F3> <ESC>:make<CR>i
"nmap <F4> :cn<CR>
"imap <F4> <ESC>:cn<CR>i
"nmap <F5> :cN<CR>
"imap <F5> <ESC>:cN<CR>i
"nmap <F6> :cl<CR>
"imap <F6> <ESC>:cl<CR>i

" re-indent a line
nmap <F8> =_j
imap <F8> <ESC>=_ji

" C-comment a line
nmap <M-[> ^i/* <ESC>A */<ESC>j
" uncomment a libe
nmap <M-{> ^3x$xxxj

" Current Fold Open/Close
nmap <ESC><RIGHT> zo
nmap <ESC><LEFT>  zc

"map Ctrl F to find in file i.e. /
map ^F /<C-R>=expand("<cword>")^M^M
"Map To capitalize the previous word
inoremap Å <ESC>vBUA

" fundu quote current word
"map ? maa0^[mbbma$a x^[`awgebi(^[ea)^[$xx`blx`a

"Match The Curly Braces
"imap { {}<ESC>i
"and quotes
"inoremap " ""<ESC>i
"and the brackets
"imap ( ()<ESC>i

"map motions
"map Å[A Åk
"map Å[B Åj
"map Å[D Åh
"map Å[C Ål
imap  Å

" Get differences
nmap <C-K> :diffget<CR>]c

"These have been set for cscope support
if has("cscope")
  set csto=0
  set cst
  set csverb
  map s<C-]> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
  map g<C-]> :cs find 1 <C-R>=expand("<cword>")<CR><CR>
  map d<C-]> :cs find 2 <C-R>=expand("<cword>")<CR><CR>
  map c<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  map t<C-]> :cs find 4 <C-R>=expand("<cword>")<CR><CR>
  map e<C-]> :cs find 6 <C-R>=expand("<cword>")<CR><CR>
  map f<C-]> :cs find 7
  map i<C-]> :cs find 8 %<CR>
  map 0<C-]> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
  map 1<C-]> :cs find 1 <C-R>=expand("<cword>")<CR><CR>
  map 2<C-]> :cs find 2 <C-R>=expand("<cword>")<CR><CR>
  map 3<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  map 4<C-]> :cs find 4 <C-R>=expand("<cword>")<CR><CR>
  map 6<C-]> :cs find 6 <C-R>=expand("<cword>")<CR><CR>
  map 7<C-]> :cs find 7
  map 8<C-]> :cs find 8 %<CR>
  map g<C-\> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

  if filereadable("cscope.out")
      cs add cscope.out
  endif
endif

" Print File Header
function! Date()
let date=system("date '+%b %d, %Y'")
"put=date
return date
endfunction
"command! -complete=command Date call Date()

function! FileHeader()
let tmp = &comments
let time=strftime("%b %d, %Y")
mark a
1
i
/******************************************************************************
**  FILE
**	
**
**  DESCRIPTION
**
**  DATE          NAME        REF    REASON
**  ------------  ----------  -----  --------------------------------
**  CurrentDate   sdahiya     -      created
**
**  Note:
**      Editor Settings: tabstop = 8, shift_width = 2
**
**  Copyright (c) 2020 Gigamon
******************************************************************************/

.
let line = getline(line(".") - 13)
let name = @%
let line = substitute(line,"$",name,"")
call setline( line(".") - 13,line)

let line = getline(line(".") - 7)
let line = substitute(line, "CurrentDate ", time, "")
call setline(line(".") - 7, line)

execute "norm! `a"
let &comments = tmp
endfunction
"command! -complete=command FileHeader call FileHeader()
"noremap <S-F3> Å:FileHeaderÅi
"inoremap <S-F3> Å:FileHeaderÅi

function! FileName()
let name=@%
return name
endfunction

"Print Function Header
function! FunctionHeader()
let tmp = &comments
mark a
i
/******************************************************************************
**  FUNCTION 
**      
**	
**  DESCRIPTION 
**	
**  RETURN VALUE 
******************************************************************************/

.
let line = getline(line(".") - 6)
let name = GetFunctionName(2)
let line = substitute(line,"$",name,"")
call setline( line(".") - 6,line)
execute "norm! `a"
let &comments = tmp
endfunction
"command! -complete=command FunctionHeader call FunctionHeader()
"noremap <S-F4> Å:FunctionHeaderÅi
"inoremap <S-F4> Å:FunctionHeaderÅi

"Add intelligent brackettimng"
"source ~/share/vim/vim57/macros/bracketing.no-meta.vim

function! LineComment()
        let line = getline(".")
        let end = strlen(line)
        let start = matchend(line,"\.\*;\[ \t]\*\[^ \t]")
        if start <= 0
                let start = matchend(line,"[^ \t]")
                if start <= 0
                        let start = 0
                else
                        let start = start - 1
                endif
        else
                let start = start - 1
        endif
""        echo start
        let comment = strpart(line,start,end)
""        echo comment
        let commented = "/* " . comment . " */"
""        echo commented
        let newline = substitute(line,comment,commented,"")
""        echo line
        if line == newline
                let newline = "/* " . line . " */"
        endif
        call setline(line("."),newline)
endfunction
"command! -complete=command LineComment call LineComment()
"map „ <ESC>:LineComment<CR>j

function! LineUncomment()
  let line = getline(line("."))
  let start = matchend(line,"/\[*]")
  if start == -1
    return
  endif
""  echo start
  let end = match(line,"\[*]/")
""  echo end
  let beforeComment = strpart(line,0,start - 2)
""  echo beforeComment . "#"
  let newLine = beforeComment
  if match(beforeComment,"\^\[ \t]\*\$") != -1
""    echo "Hi!"
    let comment = strpart(line,start + 1,end - start - 1)
""    echo comment
    let newLine = beforeComment . comment
  endif
""  echo newLine
  call setline(line("."),newLine)
endfunction
"command! -complete=command LineUncomment call LineUncomment()
"map √ <ESC>:LineUncomment<ESC>j

"function! Unmatched(pattern)
"  let index = 0
"  let open = 0
"  
"  while index < strlen(a:pattern)
"    let token = strpart(a:pattern, index, 1)
"    let index = index + 1
"  
"    if match(token,"{") == 0
"      let open = open + 1
"    elseif match(token,"}") == 0
"      let open = open - 1
"    endif
"  endwhile
"  
"  return open
"endfunction

"function! GetNextBraceLNum(lineNum)
"  let currentLine = a:lineNum + 1
"  let lines = line("$")
"
"  while currentLine <= lines
"    let line = getline(currentLine)
"    if match(line,"\.\*\[{}]\.\*") >= 0
"        break
"    endif
"    let currentLine = currentLine + 1
"  endwhile
"  if currentLine > lines
"    return -1
"  else
"    return currentLine
"  endif
"endfunction

"function! GetFunctionName( parameters)
"  let lNum = 0
"  let currentLine = line(".")
"  let openBraces = 0
"
"  let lNum = GetNextBraceLNum(lNum)
"  let maxOpen = lNum
"  while lNum <= currentLine && lNum != -1
"    let line = getline(lNum)
"    ""if match(line,"\.\*{\.\*") >= 0
"    if Unmatched(line) != 0
"      let openBraces = openBraces + Unmatched(line)
"    ""else
"      ""let openBraces = openBraces - 1
"    endif
"
"    let lNum = GetNextBraceLNum(lNum)
"    if openBraces == 0
"      let maxOpen = lNum
"    endif
"  endwhile
"
"  let funcStart = maxOpen
"  while match( getline(funcStart),'(') == -1
"    let funcStart = funcStart - 1
"  endwhile
"  if match( getline(funcStart),"\s\*(\+\k\*") != -1
"    let funcStart = funcStart - 1
"  endif
"
"  if a:parameters == 1
""" Print Function Name
"    echo substitute(getline(funcStart),"\^\.\{-}\s\*\(\k\+\)\s\*(\.\*\$",'\1',"")
"
"  elseif a:parameters == 2
"    return substitute(getline(funcStart),"\^\.\{-}\s\*\(\k\+\)\s\*(\.\*\$",'\1',"")
"  
"  elseif a:parameters == 3
""" Print Function Definition
"    if match( getline(funcStart - 2),"") != -1
"      let funcStart = funcStart - 1
"    endif
"    while funcStart < maxOpen
"      echo getline(funcStart)
"      let funcStart = funcStart + 1
"    endwhile
"
"  elseif a:parameters == 4
""" Return Function Definition
"    let name = ""
"    if match( getline(funcStart - 2),"") != -1
"      let funcStart = funcStart - 1
"    endif
"    while funcStart < maxOpen
"      let name = name . " " . getline(funcStart)
"      let funcStart = funcStart + 1
"    endwhile
"    return name
"    
"  elseif a:parameters == 5
""" Goto Next Function
"    execute "norm!" . maxOpen . "G"
"
"  elseif a:parameters == 5
"""" Goto end of this Function
"    execute "norm!" . maxOpen . "G"
"    execute "norm! %"
"    let pos = line(".") + 1
"    execute "norm!" . pos . "G"
"  endif
"endfunction
"command! -complete=command GetFunctionName call GetFunctionName(1)
"noremap <F9> <Esc>:GetFunctionName<CR>
"command! -complete=command GetFunctionDefinition call GetFunctionName(3)
"noremap <F10> <ESC>:GetFunctionDefinition<CR>
"noremap <F11> <ESC>:call GetFunctionName(5)<CR>
"noremap <F12> <ESC>:call GetFunctionName(6)<CR>
"set updatetime=500
"autocmd CursorHold * let &titlestring='%t%( %M%)%( (%{expand("%:~:.:h")})%)%( %a%)%='.GetFunctionName(2)

function! FunctionName(param)
  set nomodifiable
  let origLine = line(".")
  let prevLine = origLine
  " echo origLine

  execute "norm! [{"
  let curLine = line(".")
  if curLine == prevLine
    execute origLine
    return "Not in a function"
  endif
  while prevLine != curLine
    execute "norm! [{"
    let prevLine = curLine
    let curLine = line(".")
    " echo prevLine . " , " . curLine
  endwhile

  let name = GetFunctionName(curLine)
  " echo name
  let name_ret = GetFunctionName_and_Ret(curLine)
  " echo name_ret
  let fargs = GetFunctionArgs(curLine)
  " echo args
  
  execute origLine
  set modifiable

  if a:param == 1
    return name
  elseif a:param == 2
    return name_ret . fargs
  endif
  
  return name . fargs
endfunction

function! GetFunctionName(curLine)
  let savedReg = @x
  let savedSearch = @/

  silent execute "norm! ?)\<CR>"
  silent execute "norm! %"
  silent execute 'norm! "xyB'
  let retValue = @x
  let @x = savedReg
  let @/ = savedSearch

  execute a:curLine
  return retValue
endfunction

function! GetFunctionName_and_Ret(curLine)
  let savedReg = @x
  let savedSearch = @/

  silent execute "norm! ?)\<CR>"
  silent execute "norm! %"
  silent execute 'norm! "xy2B'
  let retValue = @x
  let @x = savedReg
  let @/ = savedSearch

  execute a:curLine
  return retValue
endfunction

function! FunctionArgs(curLine)
  let savedReg = @x
  let savedSearch = @/

  silent execute "norm! ?)\<CR>"
  silent execute 'norm! "xy%'
  let retValue = @x
  let @x = savedReg
  let @/ = savedSearch
  
  execute a:curLine
  return retValue
endfunction

function! FRet(lineNum, fStart)
  let line = a:lineNum

  let text = strpart(getline(line), 0, a:fStart)
  if text !~ "\\S\\+"
    let line = line - 1
    let text = getline(line)
    while text !~ "\\S\\+"
      let line = line - 1
      let text = getline(line)
    endwhile
  endif

  let fEnd = match(text, "\\>\\s*$")
  let fStart = match(text, "\\<\\S*\\>\\s*$")
  let fName = strpart(text, fStart, fEnd)

  return fName
endfunction

function! FName(lineNum, retType)
  let line = a:lineNum

  let text = getline(line)
  while text !~ "\.*(\.*"
    "echo line . ":'" . text . "'"
    let line = line - 1
    let text = getline(line)
  endwhile
  "echo line . ":'" . text . "'"
  
  let end = strridx(text, "(")
  let text = strpart(text, 0, end)
  
  if text !~ "\\S\\+"
    "echo "Line:" . line . " ='" . text . "'"
    let line = line - 1
    let text = getline(line)
    while text !~ "\\S\\+"
      let line = line - 1
      let text = getline(line)
    endwhile
  endif

  let fEnd = match(text, "\\>\\s*$")
  let fStart = match(text, "\\<\\S*\\>\\s*$")
  "echo "Line:" . line . " ='" . text . "'"
  let fName = strpart(text, fStart, fEnd)

  let fRet = FRet(line, fStart)

  return fRet . " " . fName
endfunction

function! ThisFunction()
  mark z
  let thisLineNum = line(".")
  let startLineNum = thisLineNum

  exec "normal [{"
  let newLineNum = line(".")

  while thisLineNum != newLineNum
    let thisLineNum = newLineNum
    exec "normal [{"
    let newLineNum = line(".")
  endwhile

  let fName = FName(newLineNum, 0)
  
  ""echo "Start = " . startLineNum . " This = "thisLineNum . " New = " . newLineNum
  echo "Function = '" . fName . "'"
  exec "normal 'z"
endfunction

"
" ctags games
" print the name of the current function in the title
"
let g:ctags_pattern="^\\(.\\{-}\\)\t.\\{-}\t\\(\\d*\\).*"

function! GenerateTags()
	let ctags=system('ctags -n --sort=no -o - "' . expand('%') . '"')
	let ctagslen=strlen(ctags)

	let b:length = 8
	let b:lines = ''

	while strlen(ctags)>0
		let one_tag = strpart(ctags, 0, match(ctags, "\n"))
		let tag_name = substitute(one_tag, g:ctags_pattern, '\1', '')
		let tag_line = substitute(one_tag, g:ctags_pattern, '\2', '')
		execute "let b:l".tag_line." = '".tag_name."'"
		let b:lines = b:lines . tag_line . strpart('          ', 0, b:length-strlen(tag_line))
		let ctags=strpart(ctags, match(ctags, "\n")+1, ctagslen)
	endwhile

	" length of b:lines should be divisible by b:length
	let b:lines = b:lines . "999999  "
endfunction

function! GetLine(i)
	return strpart(b:lines, a:i*b:length, b:length)+0
endfunction

function! GetCurrentTagName()
	if !exists("b:lines")
		return ""
	endif

	let curline=line(".")
	let left=0
	let right=strlen(b:lines)/b:length

	if curline<GetLine(left)
		return ""
	endif

	" kickass binary search
	while left<right
		let middle=(right+left+1)/2
		let middleline=GetLine(middle)

		if middleline == curline
			let left=middle
			break
		endif

		if middleline > curline
			let right=middle-1
		else
			let left=middle
		endif
	endwhile

	exe "let ret=b:l".GetLine(left)
	return ret
endfunction

"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)%=%(tag:\ %-{F()}%)
set updatetime=500
autocmd CursorHold * if exists('clevertitle') | let &titlestring='%t%( %M%)%( (%{expand("%:~:.:h")})%)%( %a%)%='.GetCurrentTagName() | endif

command! CT let clevertitle=1|e!
autocmd BufEnter *.c,*.cpp,*.h if exists('clevertitle') && !exists('b:lines') | call GenerateTags() | endif

autocmd FileType c,cpp,h,cxx hi LineTooLong ctermfg=red ctermbg=yellow| match LineTooLong /\%81v/

set tags+=../../tags

"Highlighting for Folds
highlight Folded term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=blue guibg=black
"highlight Folded guifg=blue guibg=black
" Hide Nasty Unreadable dark blue hilights
highlight NonText term=bold cterm=bold ctermfg=6 gui=bold guifg=Blue
highlight PreProc term=underline cterm=bold ctermfg=8 guifg=#ff80ff

" Table of completion specifications (a list of lists)...
let s:completions = []
" Function to add user-defined completions...
function! AddCompletion (left, right, completion, restore)
    call insert(s:completions, [a:left, a:right, a:completion, a:restore])
endfunction
let s:NONE = ""
" Table of completions...
"                    Left   Right    Complete with...       Restore
"                    =====  =======  ====================   =======
call AddCompletion(  '{',   s:NONE,  "}",                      1    )
call AddCompletion(  '{',   '}',     "\<CR>\<C-D>\<ESC>O",     0    )
call AddCompletion(  '\[',  s:NONE,  "]",                      1    )
call AddCompletion(  '\[',  '\]',    "\<CR>\<ESC>O\<TAB>",     0    )
call AddCompletion(  '(',   s:NONE,  ")",                      1    )
call AddCompletion(  '(',   ')',     "\<CR>\<ESC>O\<TAB>",     0    )
call AddCompletion(  '<',   s:NONE,  ">",                      1    )
call AddCompletion(  '<',   '>',     "\<CR>\<ESC>O\<TAB>",     0    )
call AddCompletion(  '"',   s:NONE,  '"',                      1    )
call AddCompletion(  '"',   '"',     "\\n",                    1    )
call AddCompletion(  "'",   s:NONE,  "'",                      1    )
call AddCompletion(  "'",   "'",     s:NONE,                   0    )
" Implement smart completion magic...
function! SmartComplete ()
    " Remember where we parked...
    let cursorpos = getpos('.')
    let cursorcol = cursorpos[2]
    let curr_line = getline('.')

    " Special subpattern to match only at cursor position...
    let curr_pos_pat = '\%' . cursorcol . 'c'

    " Tab as usual at the left margin...
    if curr_line =~ '^\s*' . curr_pos_pat
        return "\<TAB>"
    endif

    " How to restore the cursor position...
    let cursor_back = "\<C-O>:call setpos('.'," . string(cursorpos) . ")\<CR>"

    " If a matching smart completion has been specified, use that...
    for [left, right, completion, restore] in s:completions
        let pattern = left . curr_pos_pat . right
        if curr_line =~ pattern
            " Code around bug in setpos() when used at EOL...
            if cursorcol == strlen(curr_line)+1 && strlen(completion)==1 
                let cursor_back = "\<LEFT>"
            endif

            " Return the completion...
            return completion . (restore ? cursor_back : "")
        endif
    endfor

    " If no contextual match and after an identifier, do keyword completion...
    if curr_line =~ '\k' . curr_pos_pat
        return "\<C-N>"

    " Otherwise, just be a <TAB>...
    else
        return "\<TAB>"
    endif
endfunction

" Remap <TAB> for smart completion on various characters...
inoremap <silent> <TAB>   <C-R>=SmartComplete()<CR>

" Highlighing for terminal
"highlight comment ctermfg=5

" Do these hacks because GNU screen screw up
set term=xterm-256color
map [A gk
map [B gj
map [D h
map [C l

noremap \ldt :Linediff<CR>
noremap \ldo :LinediffReset<CR>

" Disable annoying bells
set noerrorbells visualbell t_vb=

" XML Tag commenting
nmap ^X vat:s/^\(\s*\)\(.*\)$/\1<!--\2-->/<CR>

if exists("g:BRUCE_THEME")
    echom "Finally working"
endif
function! SetSolatizedScheme()
    "set t_Co=16
    "set t_AB=^[[48;5;%dm
    "set t_AF=^[[38;5;%dm
    "set background=dark
    let g:solarized_termcolors=   16
    let g:solarized_termtrans =   0
    let g:solarized_degrade   =   0
    let g:solarized_bold      =   1
    let g:solarized_underline =   1
    let g:solarized_italic    =   0
    let g:solarized_contrast  =   "high"
    let g:solarized_visibility=   "high"
    let g:solarized_diffmode  =   "high" "high / normal / low
    let g:solarized_hitrail   =   0
    let g:solarized_menu      =   1
    colorscheme solarized
    "echom g:BRUCE_THEME
endfunction

function! ToggleBackground()
    if (g:colors_name == "solarized" && w:solarized_style == "dark")
        let w:solarized_style = "light"
        "colorscheme solarized
        call SetSolatizedScheme()
    elseif (g:colors_name == "solarized" && w:solarized_style == "light")
        colorscheme default
    elseif (g:colors_name == "default")
        colorscheme desert
    elseif (g:colors_name == "desert")
        let w:solarized_style = "dark"
        "colorscheme solarized
        call SetSolatizedScheme()
    endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F6> :call ToggleBackground()<CR>
inoremap <F6> <ESC>:call ToggleBackground()<CR>a
vnoremap <F6> <ESC>:call ToggleBackground()<CR>
"call SetSolatizedScheme()
colorscheme desert

set cursorline
"set cursorcolumn
set colorcolumn=80

" Enable mouse in terminal vim
set mouse=a

set encoding=UTF-8
