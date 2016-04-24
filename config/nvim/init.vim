" Basic color stuff
" set t_Co=256
" let g:hybrid_use_Xresources = 1

" Global replace by default
set gdefault


set guifont=Source\ Code\ Pro\ for\ Powerline:h12

let mapleader=" "
nmap <leader>v :vsplit<CR>
nmap <leader>s :split<CR>
nmap <leader>o :enew<CR>
nmap <leader>f :syntax sync fromstart<CR>
nmap <leader>h :nohlsearch<CR>
nmap <leader><leader> :b#<CR>
map <silent> <leader>p :set paste!<CR>


set hidden
set nowrap
set lazyredraw

" Store Temp Files Elsewhere
set backupdir=~/.nvim-tmp//
set directory=~/.nvim-tmp//

source ~/.config/nvim/plugged.vim
source ~/.config/nvim/plugin_config.vim
source ~/.config/nvim/filetype_settings.vim


" Line Numbers
set number

" Tab Indents
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab



" Disable that damn auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" System specific config
if has("unix")
  let s:uname = system("uname -s")
  if(s:uname == "Darwin")
    set clipboard=unnamed
  else
    set clipboard+=unnamedplus
  endif
endif

" Clipboard and Backspace
set backspace=indent,eol,start

" Open directories if argument
au VimEnter * if argc() && isdirectory(expand('%')) | cd % | NERDTree | wincmd l | new | wincmd j | q | endif


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

filetype plugin indent on
syntax on

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" Set up view dir for folds and whatnot
" autocmd BufWrite * mkview
" autocmd BufNewFile,BufRead * silent loadview

set completeopt=longest,menuone,preview

" Hide autocomplete on cursor move
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Custom commands
command -nargs=1 DE :e `dirname %`/<args>

" Functions
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
    highlight RedOnRed ctermfg=red ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    echo matchlen
    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
            \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
            \ . '\|'
            \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
    let ring = matchadd('RedOnRed', ring_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" Search highlighted text on double //
vnoremap // y/<C-R>"<CR>


" Color Theming Stuff
let g:enable_bold_font = 1
color hybrid_material
color hybrid_material
hi Normal ctermbg=none
