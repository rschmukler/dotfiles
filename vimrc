source ~/.vim/vundle.vim
source ~/.vim/plugin_config.vim

set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" Store Temp Files Elsewhere
set backupdir=/tmp/vim
set directory=/tmp/vim

" Line Numbers
set number

" Tab Indents
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent on

color Tomorrow-Night

let g:ctrlp_working_path_mode = 2
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:SuperTabDefaultCompletionType = "context"
set ofu=syntaxcomplete#Complete

let &t_Co=256

"IndentGuidesEnable

"autocmd! AuNERDTreeCmd FocusGained


