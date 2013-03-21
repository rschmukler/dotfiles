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

" Open directories if argument
au VimEnter * if argc() && isdirectory(expand('%')) | cd % | NERDTree | wincmd l | new | wincmd j | q | endif

" Color Theming Stuff
set t_Co=256
set background=dark
color base16-tomorrow

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:SuperTabDefaultCompletionType = "context"
set ofu=syntaxcomplete#Complete

filetype plugin indent on
syntax on

" Some Handy Remappings

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=
