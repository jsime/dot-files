set bs=2
set nocompatible
set encoding=utf-8

set showcmd
set showmode

set foldmethod=indent
set nofoldenable

syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

set t_Co=256

set tabstop=4
set shiftwidth=4
set expandtab

" Shorter tabs in Ruby code (to match current employer's style guide)
au BufNewFile,BufRead *.rb set ts=2 sw=2
" Same tab settings for LISP as well
au BufNewFile,BufRead *.lisp set ts=2 sw=2

set number

set ruler
set rulerformat=%64(%F,\ %l,%c%)

set incsearch hlsearch
set ignorecase smartcase

set colorcolumn=72,80,132
hi ColorColumn ctermbg=0

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

hi StatusLine ctermbg=none ctermfg=grey

set noerrorbells
set visualbell
set t_vb=

let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '*'
hi! link SignColumn LineNr
hi GitGutterAdd          ctermfg=40  ctermbg=235 " an added line
hi GitGutterChange       ctermfg=226 ctermbg=235 " a changed line
hi GitGutterDelete       ctermfg=1   ctermbg=235 " at least one removed line
hi GitGutterChangeDelete ctermfg=136 ctermbg=235 " a changed line followed by at least one removed line

highlight BadWhitespace ctermbg=200
call matchadd('BadWhitespace', '\s\+$', 10)
highlight TabIndents ctermbg=236
call matchadd('TabIndents', '^\t\+', 5)
highlight InlineTabs ctermbg=237
call matchadd('InlineTabs', '\t\+', 4)

" add golang support files from local GVM installations, only if they appear
" to exist
let golangenv=$GOROOT . '/misc/vim/readme.txt'
if filereadable(golangenv)
    filetype off
    filetype plugin indent off
    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
endif

au BufNewFile,BufRead *.mc,*.mi set filetype=mason2
au BufNewFile,BufRead *.mp set filetype=perl
au BufNewFile,BufRead *.pgsql set filetype=pgsql
au BufNewFile,BufRead *.tt2 set filetype=tt2html
au BufNewFile,BufRead *.json set filetype=json
" use real tabs for Makefiles
au BufNewFile,BufRead Makefile set noexpandtab
" this is only valid because the one project I work on that has .asp files is an Apache::ASP Perl project
au BufNewFile,BufRead *.asp set filetype=perl
" i never work with modula2, so make vim detect .md as markdown files instead
au BufNewFile,BufRead *.md set filetype=markdown

" reload (source) vimrc with \s and open it for editing with \v
nmap <Leader>s :source $MYVIMRC
nmap <Leader>v :e $MYVIMRC

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

