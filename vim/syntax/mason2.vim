" Vim syntax file
" Language: Mason2 (Moosified Perl in HTML, http://search.cpan.org/?query=Mason)
" Maintainer: Tomohiro Hosaka <bokutin@bokut.in>
" Last change: 2011 Oct 02
"
" This script is based on mason.vim by Andrew Smith.

if version < 600
	syn clear
elseif exists("b:current_syntax")
	finish
endif

" The HTML syntax file included below uses this variable.
"
if !exists("main_syntax")
	let main_syntax = 'mason2'
endif

" First pull in the HTML syntax.
"
if version < 600
	so <sfile>:p:h/html.vim
else
	runtime! syntax/html.vim
	unlet b:current_syntax
endif

syn cluster htmlPreproc add=@masonTop

" Now pull in the Perl syntax.
"
if version < 600
	syn include @perlTop <sfile>:p:h/perl.vim
else
	syn include @perlTop syntax/perl.vim
endif
syntax cluster perlTop remove=perlFunctionName remove=perlElseIfError

" It's hard to reduce down to the correct sub-set of Perl to highlight in some
" of these cases so I've taken the safe option of just using perlTop in all of
" them. If you have any suggestions, please let me know.
"
syn region masonLine matchgroup=Delimiter start="^%" end="$" contains=@perlTop
syn region masonExpr matchgroup=Delimiter start="<%" end="%>" contains=@perlTop
syn region masonPerl matchgroup=Delimiter start="<%perl>" end="</%perl>" contains=@perlTop
syn region masonInit matchgroup=Delimiter start="<%init>" end="</%init>" contains=@perlTop
syn region masonComp keepend matchgroup=Delimiter start="<&" end="&>" contains=@perlTop

syn region masonFlags matchgroup=Delimiter start="<%flags>" end="</%flags>" contains=@perlTop

syn region masonDoc matchgroup=Delimiter start="<%doc>" end="</%doc>"
syn region masonText matchgroup=Delimiter start="<%text>" end="</%text>"

"Mason2 UNNAMED BLOCKS
syn region masonClass matchgroup=Delimiter start="<%class>" end="</%class>" contains=@perlTop

"Mason2 NAMED BLOCKS
syn region masonMethod matchgroup=Delimiter start="<%method[^>]*>" end="</%method>" contains=@htmlTop
syn region masonBefore matchgroup=Delimiter start="<%before[^>]*>" end="</%before>" contains=@htmlTop
syn region masonAfter matchgroup=Delimiter start="<%after[^>]*>" end="</%after>" contains=@htmlTop
syn region masonAround matchgroup=Delimiter start="<%around[^>]*>" end="</%around>" contains=@htmlTop
syn region masonAugment matchgroup=Delimiter start="<%augment[^>]*>" end="</%augment>" contains=@htmlTop
syn region masonOverride matchgroup=Delimiter start="<%override[^>]*>" end="</%override>" contains=@htmlTop
syn region masonFilter matchgroup=Delimiter start="<%filter[^>]*>" end="</%filter>" contains=@htmlTop

syn cluster masonTop contains=masonLine,masonExpr,masonPerl,masonInit,masonComp,masonFlags,masonDoc,masonText,masonClass,masonMethod,masonBefore,masonAfter,masonAround,masonAugment,masonOverride,masonFilter

" Set up default highlighting. Almost all of this is done in the included
" syntax files.

if version >= 508 || !exists("did_mason2_syn_inits")
	if version < 508
		let did_mason2_syn_inits = 1
		com -nargs=+ HiLink hi link <args>
	else
		com -nargs=+ HiLink hi def link <args>
	endif

	HiLink masonDoc Comment

	delc HiLink
endif

let b:current_syntax = "mason2"

if main_syntax == 'mason2'
	unlet main_syntax
endif

