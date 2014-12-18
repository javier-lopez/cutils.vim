" ============================================================================
" File:        cutils.vim
" Description: misc vim functions useful for me
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

"got-ravings.blogspot.mx/2009/07/vim-pr0n-combating-long-lines.html
function! cutils#LongLines(width)
    let targetWidth = a:width != '' ? a:width : 80
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: CULongLines [natural number]"
    endif
endfunction

function! cutils#VCSInfo()
    let g:vcs_cache = {}
    let l:path = getcwd()
    if ! has_key(g:vcs_cache, l:path)
        if (isdirectory(l:path . "/.git"))
            let g:vcs_cache[l:path] = "["
                        \. substitute(readfile(l:path
                        \. "/.git/HEAD", "", 1)[0],
                        \ "^.*/", "", "") . "]"
        elseif (isdirectory(l:path . "/.svn"))
            let l:vcs_status = readfile(l:path . "/.svn/entries", "", 5)
            let g:vcs_cache[l:path] = "["
                        \. substitute(l:vcs_status[4], "^.*/", "", "")
                        \. ":r" . l:vcs_status[3]
                        \. "]"
        else
            let g:vcs_cache[l:path] = ""
        endif
    endif
    return g:vcs_cache[l:path]
endfunction

"http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
function! cutils#FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    elseif bytes < 1024
        return bytes . "b"
    elseif bytes < 1048576
        return(bytes / 1024) . "Kb"
    else
        return(bytes / 1048576) . "Mb"
    endif
endfunction

function! cutils#WhiteSpaceHunter()
    if exists ("s:whitespacehunter")
        set nolist
        echo "[SpaceHunter off]"
        unlet s:whitespacehunter
    else
        if has("gui_running")
            set list listchars=tab:▷⋅,trail:·,extends:…,nbsp:‗
        else
            " xterm + terminus hates these
            set list listchars=tab:▷⋅,trail:·,extends:>,nbsp:_
        endif
        set fillchars=fold:-
        echo "[SpaceHunter on]"
        let s:whitespacehunter = 1
    endif
endfunction

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
" Taken from http://vim.wikia.com/wiki/Modeline_magic
function! cutils#AppendModeLine()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.' ft='.&filetype.' :'
  $put =substitute(&commentstring, '%s', append, '')
  call setpos('.', save_cursor)
  redraw!
  echo "Added modeline :)"
endfunction

" Functions who cannot be autoload
function! cutils#CUSkel(_language)
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

function! cutils#CUSetProperties(_language)
    let l:properties_file = expand(g:cutils_setproperties_dir . "/properties." . a:_language)
    if filereadable(l:properties_file)
        execute "silent! source " . l:properties_file
    endif
endfunction
