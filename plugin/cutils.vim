" ============================================================================
" File:        cutils.vim
" Description: misc functions useful when using vim
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

" Init {{{1
if exists('g:loaded_cutils') || &cp
  finish
endif
let g:loaded_cutils = 1

if v:version < '700'
  echoerr "cutils unavailable: requires Vim 7.0+"
  finish
endif

" Default configuration {{{1
if !exists('g:cutils_map_longlines')
  let g:cutils_map_longlines = '<Leader>cul'
endif

if !exists('g:cutils_map_whitespacehunter')
  let g:cutils_map_whitespacehunter = '<Leader>cuw'
endif

if !exists('g:cutils_map_appendmodeline')
  let g:cutils_map_appendmodeline = '<Leader>cua'
endif

if !exists('g:cutils_setproperties_dir')
  let g:cutils_setproperties_dir = expand('<sfile>:h') . '/assets/lang'
endif

if !exists('g:cutils_skel_dir')
  let g:cutils_skel_dir = expand('<sfile>:h') . '/assets/skeletons'
endif

" Functions who cannot be autoload
function! CUSkel(_language)
    let l:skeleton_file = expand(g:cutils_skel_dir . "/skeleton." . a:_language)
    if filereadable(l:skeleton_file)
        execute "silent! 0read " . l:skeleton_file
        " Delete last line:
        normal! G
        normal! dd
        normal! gg
        call search("++HERE++")
        normal! xxxxxxxx
        " (crude, but it works)
        " To automatically switch to insert mode, uncomment the following line:
        " startinsert
    endif
endfunction

function! CUSetProperties(_language)
    let l:properties_file = expand(g:cutils_setproperties_dir . "/properties." . a:_language)
    if filereadable(l:properties_file)
        execute "silent! source " . l:properties_file
    endif
endfunction

autocmd BufNewFile,BufEnter *.php,*.php3,*.php4  call CUSetProperties("php")
autocmd BufNewFile,BufEnter *.php5,*.inc,*schema call CUSetProperties("php")
autocmd BufNewFile,BufEnter *.engine,*.ctp       call CUSetProperties("php")
autocmd BufNewFile,BufEnter *.html,*.xml         call CUSetProperties("html")
autocmd BufNewFile,BufEnter *.c,*.h              call CUSetProperties("c")
autocmd BufNewFile,BufEnter *.pl,*.pm,*.t,*ptml  call CUSetProperties("perl")
autocmd BufNewFile,BufEnter *[mM]akefile,*.mk    call CUSetProperties("make")
autocmd BufNewFile,BufEnter *.java               call CUSetProperties("java")
autocmd BufNewFile,BufEnter *.sh,*.bash          call CUSetProperties("bash")
autocmd BufNewFile,BufEnter *.{md,mdown,mkd}     call CUSetProperties("markdown")
autocmd BufNewFile,BufEnter *.{mkdn,markdown}    call CUSetProperties("markdown")
autocmd BufNewFile,BufEnter *.{mdwn,todo,notes}  call CUSetProperties("markdown")

"skeletons:
autocmd BufNewFile *.rb,*.ruby,*.eruby           call CUSkel("ruby")
autocmd BufNewFile *.sh,*.bash                   call CUSkel("sh")
autocmd BufNewFile *.tex                         call CUSkel("tex")
autocmd BufNewFile *.py,*.python                 call CUSkel("python")
autocmd BufNewFile *.html                        call CUSkel("html")
autocmd BufNewFile *.pl,*.perl                   call CUSkel("perl")
autocmd BufNewFile *.php,*.php3,*.php4,*.php5    call CUSkel("php")
autocmd BufNewFile *schema,*.inc,*.engine,*.ctp  call CUSkel("php")
autocmd BufNewFile *.c                           call CUSkel("c")

" Commands & Mappings {{{1
command! -nargs=? CULongLines call cutils#LongLines('<args>')
command! CUVCSInfo            call cutils#VCSInfo()
command! CUFileSize           call cutils#FileSize()
command! CUWhiteSpaceHunter   call cutils#WhiteSpaceHunter()
command! CUAppendModeLine     call cutils#AppendModeLine()
command! CUSetProperties      call cutils#SetProperties()
command! CUSkel               call cutils#Skel()

exe "nnoremap <silent>" g:cutils_map_longlines             ":CULongLines<CR>"
exe "nnoremap <silent>" g:cutils_map_whitespacehunter      ":CUWhiteSpaceHunter<CR>"
exe "nnoremap <silent>" g:cutils_map_appendmodeline        ":CUAppendModeLine<CR>"
