set syntax       =perl
set makeprg      =$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*
set errorformat  =%f:%l:%m

nnoremap <silent><Leader>> :%!perltidy -q<CR>
vnoremap <silent><Leader>> :!perltidy -q<CR>

let perl_extended_vars           = 1
let perl_include_pod             = 1
let perl_fold                    = 1
let perl_fold_blocks             = 1
let perl_want_scope_in_variables = 1

"r'un
map <Leader>mr :!perl ./%<CR>
"run with arguments
map <Leader>mra :!perl ./%<SPACE>

" vim: set ts=8 sw=4 tw=0 ft=vim :
