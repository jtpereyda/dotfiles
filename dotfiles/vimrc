""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   The .vimrc file, located in the home directory, may be thought of as a
" list of commands that run every time you start vim.  For example, the line
" 'set number' below is equivalent to running the command ':set number' every
" time you start vim.  This file is typically used to change default settings.
"   One thing to be aware of is that you may disable many of these options by
" setting a similar variable.  For example, line numbers may be disabled (for
" one session only) with ':set nonumber'.
"   This is the .vimrc file I typically use; you may find some of the commands
" useful.  Feel free to put this into your home directory in wormulon.
"
" -Joshua Pereyda
"""""""""""""""""""""""""""""""""""""""
syntax on             " syntax highlighting
set number            " line numbers
set ruler             " Show cursor position on bottom right of screen
set background=dark   " uses colors designed for dark terminals
"set background=light " uses colors designed for light terminals

set tabstop=4         " These 3 commands make tabs 4 spaces instead of 8
set softtabstop=4     " See this website for more details on tabs in vim:
set shiftwidth=4      " http://tedlogan.com/techblog3.html
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 " only 2 spaces for ruby

set expandtab         " This option inserts spaces when you hit tab

set autoindent        " automatically inserts indentation for new lines
"set cindent           " smarter indenting for c-like languages

set backspace=2       " Allows for intuitive backspacing.  Set by default on
                      " many systems.
                      " Try ':set backspace=1'(or 0)... if you dare!

"noremap <esc> :noh<return><esc>
                      " <esc> will now also run :noh, clearing search
                      " highlighting
" This line sets cindent for C or C++ file types, including *.h files
autocmd FileType c,cpp set cindent

" markdown format association.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Jump to the last position when opening a file a second time
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules by filetype
if has("autocmd")
  filetype plugin indent on
endif

let g:tex_flavor='latex' "Makes all .tex files use LaTeX syntax highlighting

" Asymptote syntax highlighting (requires ~/.vim/syntax/asy.vim)
augroup filetypedetect
    au BufNewFile,BufRead *.asy     setf asy
augroup END
filetype plugin on

imap qq <Esc> " Map qq to Escape key in insert mode (handy for ssh on Android)

" Highlhight characters past 80 columns
"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" Default colorscheme:
" molokai needs .vim/colors/molokai.vim from https://github.com/tomasr/molokai
" solarized needs .vim/colors/solarized.vim from
" https://github.com/altercation/vim-colors-solarized.git
colorscheme molokai
