[cutils](https://github.com/chilicuil/cutils) is a repository of small functions I've found useful when using [vim](http://vim.org). This plugin was created to clean my vimrc file (which at the time was getting huge > 1200 LOC!). Feel free to use it, suggest new functions or improve current ones.

NOTE: Not all functions are mine. you'll find the url/author from where I fetch the original versions at the documentation.

<p align="center">
  <img src="http://javier.io/assets/img/vim-cutils.jpg"/><br>
</p>

Requirements
------------

* Vim 7.0+

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your $HOME/.vimrc file:

        Bundle 'chilicuil/cutils'

    And run inside of vim:

        :BundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/chilicuil/cutils.git ~/.vim/bundle/cutils

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv cutils*.zip $HOME/.vim
        cd $HOME/.vim && unzip cutils*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

[cutils](https://github.com/chilicuil/cutils) define at least the following functions:

 - CULongLines (show long lines)

        :CULongLines [#_characters]
        let g:cutils_map_longlines = '<Leader>cul'

<p align="center">
  <img src="http://javier.io/assets/img/culonglines.gif"/><br>
</p>

 - CUVCSInfo (show branch information, support: git, svn)

        :echo CUVCSInfo()
        [master]
        :set statusline+=%{CUVCSInfo()}

<p align="center">
  <img src="http://javier.io/assets/img/cuvcsinfo.png"/><br>
</p>

 - CUFileSize (show current file size in Kb or MB)

        :echo CUFileSize()
        2kb
        set statusline+=%-7{CUFileSize()}

<p align="center">
  <img src="http://javier.io/assets/img/cufilesize.png"/><br>
</p>

 - CUAppendModeLine (append modeline at the end of current file)

        :CUAppendModeLine
        let g:cutils_map_appendmodeline  = '<Leader>cua'

<p align="center">
  <img src="http://javier.io/assets/img/cuappendmodeline.gif"/><br>
</p>

 - CUSetProperties (apply preferences by lang)

        let g:cutils_setproperties_dir  = './assets/lang'

<!--TODO 11-03-2014 02:24 >> look for replacement-->
 - CUSkel (template system for empty files)

        let g:cutils_skel_dir  = './assets/skeletons'

<p align="center">
  <img src="http://javier.io/assets/img/cuskel.gif"/><br>
</p>

License
-------

© 2014 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/
