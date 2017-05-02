" ============================================================================
" File:        cutils.vim
" Description: misc vim functions
" Maintainer:  Javier Lopez <m@javier.io>
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
if !exists('g:cutils_map_longlines') | let g:cutils_map_longlines = '<Leader>cul' | endif
if !exists('g:cutils_map_appendmodeline') | let g:cutils_map_appendmodeline = '<Leader>cua' | endif
if !exists('g:cutils_setproperties_dir') | let g:cutils_setproperties_dir = expand('<sfile>:h') . '/assets/lang' | endif
if !exists('g:cutils_skel_dir') | let g:cutils_skel_dir = expand('<sfile>:h') . '/assets/skeletons' | endif
if !exists('g:cutils_visualsearch') | let g:cutils_visualsearch = 1 | endif

autocmd BufNewFile,BufEnter *.php,*.php3,*.php4  call cutils#CUSetProperties("php")
autocmd BufNewFile,BufEnter *.php5,*.inc,*schema call cutils#CUSetProperties("php")
autocmd BufNewFile,BufEnter *.engine,*.ctp       call cutils#CUSetProperties("php")
autocmd BufNewFile,BufEnter *.html,*.xml         call cutils#CUSetProperties("html")
autocmd BufNewFile,BufEnter *.c,*.h              call cutils#CUSetProperties("c")
autocmd BufNewFile,BufEnter *.pl,*.pm,*.t,*ptml  call cutils#CUSetProperties("perl")
autocmd BufNewFile,BufEnter *[mM]akefile,*.mk    call cutils#CUSetProperties("make")
autocmd BufNewFile,BufEnter *.java               call cutils#CUSetProperties("java")
autocmd BufNewFile,BufEnter *.sh,*.bash          call cutils#CUSetProperties("bash")
autocmd BufNewFile,BufEnter *.{md,mdown,mkd}     call cutils#CUSetProperties("markdown")
autocmd BufNewFile,BufEnter *.{mkdn,markdown}    call cutils#CUSetProperties("markdown")
autocmd BufNewFile,BufEnter *.{mdwn,todo,notes}  call cutils#CUSetProperties("markdown")

"skeletons:
autocmd BufNewFile *.rb,*.ruby,*.eruby           call cutils#CUSkel("ruby")
autocmd BufNewFile *.sh,*.bash                   call cutils#CUSkel("sh")
autocmd BufNewFile *.tex                         call cutils#CUSkel("tex")
autocmd BufNewFile *.py,*.python                 call cutils#CUSkel("python")
autocmd BufNewFile *.html                        call cutils#CUSkel("html")
autocmd BufNewFile *.pl,*.perl                   call cutils#CUSkel("perl")
autocmd BufNewFile *.php,*.php3,*.php4,*.php5    call cutils#CUSkel("php")
autocmd BufNewFile *schema,*.inc,*.engine,*.ctp  call cutils#CUSkel("php")
autocmd BufNewFile *.c                           call cutils#CUSkel("c")
autocmd BufNewFile *.css                         call cutils#CUSkel("css")

" Commands & Mappings {{{1
command! -nargs=? CULongLines call cutils#LongLines('<args>')
command! CUVCSInfo            call cutils#VCSInfo()
command! CUFileSize           call cutils#FileSize()
command! CUAppendModeLine     call cutils#AppendModeLine()
command! CUSetProperties      call cutils#SetProperties()
command! CUSkel               call cutils#Skel()
command! CUVisualSearch       call cutils#VisualSearch()

exe "nnoremap <silent>" g:cutils_map_longlines             ":CULongLines<CR>"
exe "nnoremap <silent>" g:cutils_map_appendmodeline        ":CUAppendModeLine<CR>"

if g:cutils_visualsearch
    xnoremap * :<C-u>CUVisualSearch<CR>/<C-R>=@/<CR><CR>
    xnoremap # :<C-u>CUVisualSearch<CR>?<C-R>=@/<CR><CR>
endif
