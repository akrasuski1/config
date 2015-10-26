set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tomvanderlee/vim-kerboscript'

" All of your Plugins must be added before the following line
call vundle#end()

set tabstop=4     " Tab character in text is 4 columns wide
set softtabstop=4 " 4 columns are used after pressing Tab
set shiftwidth=4  " >> and << use 4 columns
set noexpandtab   " Use tabs, not spaces
set autoindent    " Use automatical indentation
filetype plugin indent on " Same, but specialized for languages
set mouse=a       " Enable mouse usage
set number        " Enable line numbering
set nowrap        " Disable wrapping
set viminfo='100,<5000,s1000 " 100 - irrelevant, 
                             " 5000 lines maximum register size persistence,
							 " 1000kB max persistence size

set t_Co=256      " 256 colors terminal
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guibg=NONE guifg=NONE
set cursorline    " Make current line 'selected' using dark grey
hi Visual cterm=reverse ctermbg=black
                  " Use black letters on colored background during visual
				  " selection
