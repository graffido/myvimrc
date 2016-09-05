set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

execute pathogen#infect()
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

let g:fencview_autodetect=0
set rtp+=$GOROOT/misc/vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cul 
set cuc
set shortmess=atI    
set go=             
syntax enable
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
if has('gui_running')
    colorscheme solarized
    set background=dark
else
    colorscheme darkblue
endif

autocmd InsertEnter * se cul     
set ruler            
set showcmd        
set scrolloff=3       
set laststatus=2     
set nocompatible   

if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

set autoindent
set cindent

set tabstop=4

set softtabstop=4
set shiftwidth=4

set expandtab

set smarttab

set number

set history=1000

set hlsearch
set incsearch

set langmenu=zh_CN.UTF-8
set helplang=cn

set cmdheight=2

filetype on

filetype plugin on

filetype indent on

set viminfo+=!

set iskeyword+=_,$,@,%,#,-

vmap "+y :w !pbcopy<CR><CR>  
nmap "+p :r !pbpaste<CR><CR> 

au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript


nmap tt :%s/\t/    /g<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 

func SetTitle() 

	if &filetype == 'sh' 
		call setline(1,"#!/bin/bash") 
		call setline(2, "# File Name: ".expand("%")) 
		call setline(3, "# Author: Fang Pin") 
		call setline(4, "# Mail: fangpin1993@hotmail.com") 
		call setline(5, "# Created Time: ".strftime("%c")) 
		call setline(6, "") 
		call setline(7, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call setline(2,"# coding=utf-8")
        "call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "# File Name: ".expand("%")) 
		call append(line(".")+2, "# Author: Benjamin Peng") 
		call append(line(".")+3, "# Mail: pbinbin@hotmail.com") 
		call append(line(".")+4, "# Created Time: ".strftime("%c")) 
	    call append(line(".")+5, "") 
	    call append(line(".")+6, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: Benjamin Peng") 
		call append(line(".")+2, "# Mail: pbinbin@hotmail.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
	    call append(line(".")+4, "")
	    call append(line(".")+5, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Benjamin Peng") 
		call append(line(".")+2, "	> Mail: pbinbin@hotmail.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif

endfunc 
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-O> <C-Y>,
imap <C-k> <C-y>,
imap <C-j> <ESC>
imap jj <ESC>
imap JJ <ESC>
set mouse=v
nnoremap <leader>CC <Plug>CRV_CRefVimInvoke

nnoremap <F2> :g/^\s*$/d<CR> 

nnoremap <C-F2> :vert diffsplit 
 
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
        exec "!g++ -std=c++11 % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
    elseif &filetype == 'cpp'
	    exec "!g++ -std=c++11 % -g -o %<"
    endif
"linux use g++
	"exec "!gdb -tui ./%<"
"Mac os x use llvm
    exec "!lldb ./%<"
endfunc




map <F6> :call FormartSrc()<CR><CR>


func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

"autocmd vimenter *  NERDTree

"autocmd VimEnter * wincmd p

autocmd vimenter *  Tagbar


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


autocmd bufenter * if (winnr("$") == 3 && exists("b:TagbarType") &&b:TagbarType == "primary")  | qa | endif



set autoread

autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

set autowrite
set magic                   
set guioptions-=T           
set guioptions-=m           

set nocompatible

set noeb

set confirm

set nobackup
set noswapfile

set ignorecase




set linespace=0

set wildmenu

set backspace=2

set whichwrap+=<,>,h,l

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set report=0

set fillchars=vert:\ ,stl:\ ,stlnc:\

set showmatch

set matchtime=1

set scrolloff=3
filetype plugin indent on 

set completeopt=longest,menu,preview
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set tags+=~/.vim/cpptags
"set tags+=tags  
set autochdir 



let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

set nocompatible               " be iMproved
"filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'alvan/vim-closetag'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'https://github.com/wincent/command-t.git'
Bundle 'Auto-Pairs'
Bundle 'python-imports.vim'
Bundle 'synmark.vim'
Bundle 'SQLComplete.vim'
Bundle 'ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'http://github.com/c9s/colorselector.vim'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'https://github.com/vim-scripts/a.vim.git'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'

"snipmate
" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'
"
"" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<tab>"
" "

runtime macros/matchit.vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']


let NERDTreeIgnore=['\.pyc']
let g:NERDTreeWinSize=20
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif



nmap <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
"let g:tagbar_ctags_bin='~/ctags'
