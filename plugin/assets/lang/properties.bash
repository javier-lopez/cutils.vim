set syntax  =sh
set makeprg =chmod\ +x\ %

"r'un
map <Leader>mr :!./%<CR>
"compile & run (a'll)
map <Leader>ma :w<CR>:!./%<CR>
"run with arguments
map <Leader>mra :!./%<SPACE>

" vim: set ts=8 sw=4 tw=0 ft=vim :
