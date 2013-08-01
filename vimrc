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

let perl_extended_vars = 1
let perl_include_pod = 1
let perl_want_scope_in_variables = 1

au BufNewFile,BufRead *.mc,*.mi set filetype=mason2
au BufNewFile,BufRead *.mp set filetype=perl
au BufNewFile,BufRead *.pgsql set filetype=pgsql
" this is only valid because the one project I work on that has .asp files is an Apache::ASP Perl project
au BufNewFile,BufRead *.asp set filetype=perl
au BufNewFile,BufRead *.tt2 set filetype=tt2
