set syntax  =sh
set makeprg =chmod\ +x\ %

"r'un
map <Leader>mr :!./%<CR>
"run with arguments
map <Leader>mra :!./%<SPACE>
"compile & run (a'll)
map <Leader>ma :w<CR>:make && ./%<CR>

" vim: set ts=8 sw=4 tw=0 ft=vim :
