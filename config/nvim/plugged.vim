call plug#begin('~/.config/nvim/plugged')

Plug 'gmarik/vundle'

" Themes
Plug 'cseelus/sleepwalker-vim'
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'mhumeSF/one-dark.vim'
Plug 'jscappini/material.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'


" Utilities
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'markcornick/vim-terraform'
Plug 'benekastah/neomake'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': '~/.config/nvim/plugged/ctrlp-cmatcher/install.sh' }
Plug 'ervandew/supertab', { 'for': [ 'javascript', 'go', 'rust', 'html', 'css' ] }
Plug 'The-NERD-Commenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-abolish'
Plug 'Valloric/YouCompleteMe', { 'for': 'typescript' }
Plug 'rizzatti/dash.vim'


Plug 'Shougo/deoplete.nvim', { 'for': [ 'rust', 'go', 'html', 'javascript', 'css', 'sass', 'scss' ] }
Plug 'Shougo/echodoc.vim'

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" Syntax Plugins
Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'garyburd/go-explorer', { 'do': 'go get github.com/garyburd/go-explorer/src/getool' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'wavded/vim-stylus'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'darthdeus/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'apple/swift', { 'rtp': 'utils/vim' }
Plug 'uarun/vim-protobuf'
Plug 'jparise/vim-graphql'

Plug 'vim-scripts/Vim-R-plugin'
Plug 'klen/python-mode'
Plug 'vim-scripts/nimrod.vim'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'derekwyatt/vim-scala'
Plug 'veegee/cql-vim'
Plug 'guns/vim-clojure-static'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Matt-Deacalion/vim-systemd-syntax'

" Js plugins...
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'rschmukler/pangloss-vim-indent'
Plug 'vim-scripts/SyntaxComplete'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'typescript' }
Plug 'facebook/vim-flow'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'make' }
Plug 'leafgarland/typescript-vim'


" Other plugins
Plug 'mattn/emmet-vim'

call plug#end()
