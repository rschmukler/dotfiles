set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Themes
Bundle 'cseelus/sleepwalker-vim'
Bundle 'ap/vim-css-color'
Bundle 'chriskempson/base16-vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'nanotech/jellybeans.vim'
Bundle 'w0ng/vim-hybrid'



" Go plugins
Bundle 'fatih/vim-go'


" Utilities
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Align'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'The-NERD-Commenter'
Bundle 'junegunn/goyo.vim'
Bundle 'tpope/vim-abolish'

" Syntax Plugins
Bundle 'wavded/vim-stylus'
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'darthdeus/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'toyamarinyon/vim-swift'
Bundle 'vim-scripts/Vim-R-plugin'
Bundle 'klen/python-mode'
Bundle 'vim-scripts/nimrod.vim'
Bundle 'vim-scripts/SQLComplete.vim'
Bundle 'ekalinin/Dockerfile.vim'

" Js plugins...
Bundle 'othree/yajs.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'rschmukler/pangloss-vim-indent'
Bundle 'vim-scripts/SyntaxComplete'
Bundle 'marijnh/tern_for_vim'
