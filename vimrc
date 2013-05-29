" Basic color stuff
set t_Co=256
let g:hybrid_use_Xresources = 1

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

" Disable that damn auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open directories if argument
au VimEnter * if argc() && isdirectory(expand('%')) | cd % | NERDTree | wincmd l | new | wincmd j | q | endif

" Color Theming Stuff
color hybrid

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

filetype plugin indent on
syntax on

" Some Handy Remappings

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

" Custom commands
command -nargs=1 Diredit :e `dirname %`/<args>
command -nargs=1 DE :e `dirname %`/<args>
