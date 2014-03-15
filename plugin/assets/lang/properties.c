set syntax  =c
set makeprg =LANGUAGE=en\ CFLAGS='-g\ -Wall'\ make\ %:r

"r'un
map <Leader>mr :!./%:r<CR>
"compile & run (make a'll)
map <Leader>ma :w<CR>:make && ./%:r<CR>

" vim: set ts=8 sw=4 tw=0 ft=vim : 
