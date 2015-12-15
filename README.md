## Installation

1. `git clone http://github.com/jcugno/dot_vim.git` in your home folder.
2. `mv dot_vim .vim`
3. `cd .vim`
4. sym link vimrc and gvimrc to your $HOME.
5. Install [Vundle](https://github.com/gmarik/vundle) with `git clone http://github.com/gmarik/vundle.git bundle/vundle`
6. Run Vim and type `:BundleInstall` to install the plugins with Vundle.

## Requirements

**Mac**

 * [MacVim](http://code.google.com/p/macvim/) 

**Windows**

 * [gVim](http://www.vim.org/download.php#pc) - I'm currently using [Wu Yongwei's](http://wyw.dcweb.cn) pre-compiled [gVim 7.3.333](http://wyw.dcweb.cn/download.asp?path=vim&file=gvim73.zip) because it has Ruby support and the latest patches

## Notes

Be sure to always edit the vimrc using `,v`, which opens the vimrc in the .vim folder. Vim has a nasty habit of overriding symlinks.

## Plugin Installation / Requirements

I may make this more verbose later, but for now, here's a list of plugins that require further installation:

 * [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed
 * [syntastic](https://github.com/scrooloose/syntastic) Requires many different binaries installed depending on what filetypes you want it to check
 * [ack.vim](https://github.com/mileszs/ack.vim) Requires [ack](http://betterthangrep.com/) to be installed
