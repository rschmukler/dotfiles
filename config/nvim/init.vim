" Global replace by default
set gdefault

set guifont=Source\ Code\ Pro\ for\ Powerline:h12

if (has("termguicolors"))
  set termguicolors
endif

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
set ttyfast
set synmaxcol=128

" Store Temp Files Elsewhere
set backupdir=~/.nvim-tmp//
set directory=~/.nvim-tmp//

source ~/.config/nvim/plugged.vim
source ~/.config/nvim/plugin_config.vim
source ~/.config/nvim/filetype_settings.vim
source ~/.config/nvim/extensions.vim

" Color Theming Stuff
syntax on
let g:enable_bold_font = 1
set background=dark
colorscheme one

let g:airline_theme='one'

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

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" Set up view dir for folds and whatnot
" autocmd BufWrite * mkview
" autocmd BufNewFile,BufRead * silent loadview

set noshowmode
set completeopt=longest,menuone

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

nnoremap <leader>c :call ToggleLightDark()<cr>
function! ToggleLightDark()
  if &background == "dark"
    set background=light
    let g:airline_theme='PaperColor'
    colorscheme PaperColor
  else
    set background=dark
    let g:airline_theme='gruvbox'
    color gruvbox
    " hi Normal ctermbg=none
  endif
endfunction

" Jumps from an Elixir module file to an Elixir test file.
fun! ExTestToggle()
  if expand('%:e') == "ex"

    let test_file_name = expand('%:t:r') . "_test.exs"
    let test_file_dir = substitute(expand('%:p:h'), "/lib/", "/test/", "")
    let full_test_path = join([test_file_dir, test_file_name], "/")

    e `=full_test_path`

  elseif match(expand('%:t'), "_test.exs") != -1

    let test_file_name = expand('%:t:r')
    let offset_amt = strlen(test_file_name) - strlen("_test")
    let module_file_name = strpart(test_file_name, 0, offset_amt) . ".ex"
    let module_file_dir = substitute(expand('%:p:h'), "/test/", "/lib/", "")
    let full_module_path = join([module_file_dir, module_file_name], "/")

    e `=full_module_path`

  endif
endfun
