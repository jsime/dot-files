syntax on
set background=dark

set t_Co=256
color slate

set tabstop=4
set shiftwidth=4
set expandtab

set number
set numberwidth=5

set ruler
set rulerformat=%64(%F,\ %l,%c%)

set incsearch hlsearch
set ignorecase smartcase

let perl_extended_vars = 1
let perl_include_pod = 1
let perl_want_scope_in_variables = 1

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

hi StatusLine ctermbg=none ctermfg=black

set noerrorbells
set visualbell
set t_vb=

au BufNewFile,BufRead *.mc,*.mi set filetype=mason2
au BufNewFile,BufRead *.mp set filetype=perl
au BufNewFile,BufRead *.pgsql set filetype=pgsql
" this is only valid because the one project I work on that has .asp files is an Apache::ASP Perl project
au BufNewFile,BufRead *.asp set filetype=perl
au BufNewFile,BufRead *.tt2 set filetype=tt2

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

