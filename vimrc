source ~/.vim/vundle.vim
source ~/.vim/plugin_config.vim
source ~/.vim/filetype_settings.vim

set guifont=Source\ Code\ Pro\ for\ Powerline:h12

set nowrap

" Store Temp Files Elsewhere
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" Line Numbers
set number

" Tab Indents
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


"Color Theming Stuff
set t_Co=256
set background=dark
color base16-tomorrow

let g:ctrlp_working_path_mode = 2
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:SuperTabDefaultCompletionType = "context"
set ofu=syntaxcomplete#Complete

filetype plugin indent on
syntax on
