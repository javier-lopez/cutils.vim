set syntax              =php
"requires php-cli
set makeprg             =php\ -l\ %
set errorformat         =%m\ in\ %f\ on\ line\ %l

set softtabstop         =2
set tabstop             =2
set shiftwidth          =2
let php_sql_query       = 1
let php_baselib         = 1
let php_htmlInStrings   = 1
let php_folding         = 1
"don't show variables in freaking php
"let tlist_php_settings = 'php;c:class;d:constant;f:function'

" vim: set ts=8 sw=4 tw=0 ft=vim :
