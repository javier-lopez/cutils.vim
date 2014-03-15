set syntax  =java
set makeprg =javac\ %

"r'un
map <Leader>mr :!java %:r<CR>
"compile & run (a'll)
map <Leader>ma  :w<CR>:make && java %:r<CR>
"debug without arguments
map <Leader>md  :w<CR>:make && jdb %:r<CR>
"debug with arguments
map <Leader>mda :w<CR>:make && jdb %:r<SPACE>

let java_highlight_all       = 1
let java_highlight_functions = "style"
let java_allow_cpp_keywords  = 1

" vim: set ts=8 sw=4 tw=0 ft=vim :
