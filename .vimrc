" file:~/.vimrc docs at the end
" everything after a double quote is a comment.
" enable syntax hightlighting

set lines=38
set columns=150

" adjust the backspace behaviour 
set backspace=indent,eol,start

" allways show status line
set ls=2

" set the default windows height to 92
set winheight=92

" set the brightest possible colorscheme
colorscheme elflord
" colorscheme Tomorrow-Night-Blue

" v1.1.9
" the num of spaces for a tab - 4 is too much , 2 is too little
" convert tabs into spaces
set tabstop=3
set shiftwidth=3
set expandtab
" how-to see the tabs ?!
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< 
" but hei how-to unset the visible tabs ?!
" :set nolist
" display always the row number on the left 
set number

" show the title in the console title bar
" set title                   " Show the filename in the window title bar.

" smooth changes
set ttyfast

" autoindent by default
set autoindent

" set the default shift width
set sw=3

" set the number of columns
set co=120

" set wrapping by default
set wrap

" START search related configs and helps
" in Normal mode type / and start typing the string to search down
" in Normal mode type ? and start typing the string to search up
" in Normal mode type n to jump to the next match in the file and N to jump back
" ignore case when searching
set ignorecase

" search as characters are entered, as you type in more characters, the search is refined
set incsearch           

" highlight matches, in normal mode try typing * or even g* when cursor on string
set hlsearch            

" yank those cheat commands, in normal mode type q: than p to paste in the opened cmdline
" how-to search for a string recursively
" :grep! "\<doLogErrorMsg\>" . -r
"
" how-to search recursively , omit log and git files
" :vimgrep /srch/ `find . -type f \| grep -v .git \| grep -v .log`
" :vimgrep /srch/ `find . -type f -name '*.pm' -o -name '*.pl'`
"
" how-to search for the "srch" from the current dir recursively in the shell
" vim -c ':vimgrep /srch/ `find . -type f \| grep -v .git \| grep -v .log`'
" 
" how-to highlight the after the search the searchable string
" in normmal mode press g* when the cursor is on a matched string

" how-to jump between the search matches - open the quick fix window by 
" :copen 22

" how-to to close the quick fix window 
" :ccl

" F5 will find the next occurrence after vimgrep
map <F5> :cp!<CR>

" F6 will find the previous occurrence after vimgrep
map <F6> :cn!<CR>

" F8 search for word under the cursor recursively , :copen , to close -> :ccl
nnoremap <F8> :grep! "\<<cword>\>" . -r<CR>:copen 33<CR>

" omit a dir from all searches to perform globally
set wildignore+=**/node_modules/**

" use perl regexes - src: http://andrewradev.com/2011/05/08/vim-regexes/
noremap / /\v
"
" use perltidy with pre-configured mojolicious settings
" '<,'>!perltidy -pro=cnf/perl/.perltidyrc -q
" STOP  search related configs and helps

" START files and buffers related configs and helps
" how-to open files by shell pattern in their file path in the shell
" vim -c ':args `find . -type f -name '\''*backup-file.*.sh'\''`'
" and the same in vim cmdline
" :args `find . -type f -name '*backup-file.*.sh'`
" 
" to open a file starting with the "Reader" string
" :fin Reader, tab, tab
" display all the matthing files
set wildmode=longest,list,full
set wildmenu
"
" F3 would go to the next buffer
map <F3> :bn!<CR>

" F2 would go to the previous bugger
map <F2> :bp!<CR>

" F7 would list all the buffers - type bugger num or file name to open it
nnoremap <F7> :buffers<CR>:buffer<Space>

" show additional info for the current buffer - line, char number
set ruler

" set the syntax by default
syntax on

" enable filetype plugin
filetype plugin on

" http://stackoverflow.com/a/1588848/65706 - delete the annoying .swp
" files handling behaviour 
set shortmess+=A

" src: https://github.com/colbycheeze/dotfiles/blob/master/vimrc
set backspace=2   " Backspace deletes like most programs in insert mode

" Automatically :write before running commands
set autowrite     

" Reload files changed outside vim
set autoread      

" highlight the current line
set cursorline    

" Make it obvious where 100 characters is
set textwidth=100


" START files handling
"
" src: https://gist.github.com/millermedeiros/1262085
" Local dirs (centralize everything)
"
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
" recursive file search by typing :file <<str-in-file-name>>
set path +=**

" how-to open files starting with a string 
" :fin Reader tab tab

" how-to open files in vim from the shell 
" vim -c ':args `find . -type f -name '\''*backup-file.*.sh'\''`'
" STOP files handling

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally
"
"
" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" src: https://www.youtube.com/watch?v=XA2WjJbmmoM
filetype plugin on
         

" some cheats
" to-upper-case in visual mode ~
"
" Purpose:
" ---------------------------------------------------------
" provide the defaults for the vim on a 057230ffe0aa
" credits and sources : 
" http://phuzz.org/vimrc.html
" http://dougblack.io/words/a-good-vimrc.html#search
" https://www.fprintf.net/vimCheatSheet.html
"
" Usage:
" ---------------------------------------------------------
" :so %
" :so ~/.vimrc
" ---------------------------------------------------------
"
" g/srch/#
" how-to search for file / dir names starting with SomeStr
" how-to srch for the word under the cursor forward - *
" how-to srch for the word under the cursor backwards - #
" how-to display all the lines in the file having the srch string
" how-to yank the second or n-th latest yank 
" in normal mode type: "1p or "np
" how-to open all files bellow the root folder matching a file pattern
" how-to set marks globally - in normal mode mA , mB  
" how-to jump to marks globally - in normal - 'A , 'B
" how-to set marks in the current file - in normal mode mA , mB  
" how-to jump to marks in the current file - in normal - 'A , 'B
" how-to delete all the marks
" how-to open the previous file - Ctrl + ^
" :delm! | delm A-Z0-9
" how-to open a filename somewhere under the current root
" :args **/*file-name*
" how-to open multiple files by patterns
" :args **/*sbt*func.sh | execute 'argdo tabe %' | syntax on
"
" VersionHistory
" ---------------------------------------------------------
" export version=1.2.4
"
" 1.2.4 --- 2017-09-12 13:38:01 --- ysg --- how-to open files by patterns
" 1.2.3 --- 2017-08-18 15:59:08 --- ysg --- more search related tips & tricks in docs
" 1.2.2 --- 2017-05-27 22:45:14 --- ysg --- combine all src related confs and helps 
" 1.2.1 --- 2017-02-02 23:28:38 --- ysg --- search recursively in files of types example
" 1.2.0 --- 2016-12-16 13:34:28 --- ysg --- F5 for recursive word under cursor srch
" 1.1.9 --- 2016-12-07 15:58:49 --- ysg --- tabs into spaces ... 
" 1.1.7 --- 2016-11-01 05:00:09 --- ysg --- various optimizations
" 1.1.7 --- 2016-10-31 09:59:57 --- ysg --- added recursive file search
" 1.1.5 --- 2016-08-19 14:17:42 --- ysg --- highlight the current line
" 1.1.4 --- 2016-07-22 08:43:04 --- ysg --- removed annoying swap file msg
" 1.1.3 --- 2013-04-24 14:18:12 --- ysg --- added the filetype plugin on
" 1.1.2 --- 2012-12-26 11:42:26 --- ysg --- re-formatting
" 1.1.0 --- 2012-12-25 10:56:12 --- ysg --- to vim syntax, new settings
" 1.0.0 --- 2012-12-24 14:22:52 --- ysg --- Initial creation from source
"
" eof file: ~/.vimrc
