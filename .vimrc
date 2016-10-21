
set nocompatible

colorscheme default

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" To install new plugins, put git://whatever here, run vim, and
" type :PluginInstall

Plugin 'gmarik/Vundle.vim'
" Plugin 'git://github.com/scrooloose/syntastic.git'
" Plugin 'tomvanderlee/vim-kerboscript'

Plugin 'git://github.com/Valloric/YouCompleteMe.git'
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_conf.py'
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '?'
let g:ycm_auto_trigger = 0 " Only manual completer
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_whitelist={'cpp':1,'c':1} " Only in C/C++
let g:ycm_path_to_python_interpreter='/usr/bin/python'
hi YcmWarningSection ctermbg=58 " Yellow warnings
hi YcmErrorSection ctermbg=52   " Red errors

" All of your Plugins must be added before the following line
call vundle#end()

set incsearch     " Incremental search by /
set ignorecase    " Search smart-case-sensitively, i.e. not
set smartcase     " sensitive usually, but sensitive if upper case.

set tabstop=4     " Tab character in text is 4 columns wide
set softtabstop=4 " 4 columns are used after pressing Tab
set shiftwidth=4  " >> and << use 4 columns
set noexpandtab   " Use tabs, not spaces
set cindent       " Use C-like indentation
filetype plugin indent on " Same, but specialized for languages
set mouse=a       " Enable mouse usage
set number        " Enable line numbering
set nowrap        " Disable wrapping
set scrolloff=5   " Make at least 5 lines around cursor visible.
set wildmenu      " Enable tab wildmenu at command prompt.
set viminfo='100,<5000,s1000 " 100 - irrelevant, 
                             " 5000 lines maximum register size persistence,
							 " 1000kB max persistence size
set ttimeoutlen=100  " Make escape sequences timeout 100ms.
set undofile         " Save undo history for files even after
set undodir=~/.vim/undohist " closing them in .vim directory.


" Keys:
set pastetoggle=<F2> " Toggle set paste using F2

au BufRead,BufNewFile *.ks set filetype=kerboscript
au BufRead,BufNewFile *.reverse set filetype=reverse

set t_Co=256      " 256 colors terminal
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guibg=NONE guifg=NONE
set cursorline    " Make current line 'selected' using dark grey
hi Visual cterm=reverse ctermbg=black
                  " Use black letters on colored background during visual
				  " selection
hi SignColumn ctermbg=233 
				  " Make gutter almost black.
let c_no_curly_error=1
                  " Make the mp[{1,1}] syntax correct in C++11
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
                  " Start where you left off.

