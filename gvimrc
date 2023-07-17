" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background

  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
  "highlight Constant gui=NONE guibg=grey95
  "highlight Special gui=NONE guibg=grey95
endif

" Do custom changes below this line
  highlight Normal guibg=black guifg=white
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
  "highlight Constant gui=NONE guibg=grey95
  "highlight Special gui=NONE guibg=grey95

  highlight cComment guifg=#3680ff ctermfg=5
  "highlight cConstant guibg=black guifg=#ff1fc6
  "highlight cString guifg='light green'

"  set guifont=-*-fixed-medium-*-*-*-20-*-*-*-*-*-*-*
"  set guifont=-*-courier-medium-r-normal-*-14-*-*-*-*-*-*-*
"  set guifont=-*-fixed-medium-r-normal-*-20-*-*-*-*-*-*-*
"  set guifont=-adobe-courier-medium-r-normal-*-17-*-*-*-m-*-iso8859-1
"  set guifont=-b&h-lucidatypewriter-medium-r-normal-sans-14-140-75-75-m-90-iso8859-1

" Custom Highlighting for C-files
if has ("autocmd")
  " Mark anything beyond 80 cols in red
  "autocmd FileType c,cpp,h,cxx hi LineTooLong guifg=black guibg=white| match LineTooLong /\%81v.\+/
  autocmd FileType c,cpp,h,cxx hi LineTooLong guifg=yellow guibg=red| match LineTooLong /\%81v/
  "autocmd FileType c,cpp,h,cxx hi Comment guifg=LightBlue4
  "autocmd FileType c,cpp,h,cxx hi cComment guifg=lightBlue1| hi cString guifg=green
endif

if has ("autocmd")
    autocmd FileType c,cpp,h,cxx set nowrap
endif

"hi Comment guifg=lightblue4
"hi cComment guifg=lightblue1
"hi cString guifg=green
"hi Number guibg=NONE

" Dont want to hear any annoying bells or see any flashes
set vb t_vb=
