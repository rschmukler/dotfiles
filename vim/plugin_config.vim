" Ctrl-P
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules

let g:ctrlp_working_path_mode = 2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <D-t> :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0

autocmd vimenter * if !argc() | NERDTree | wincmd l | endif

" PowerLine
let g:Powerline_symbols = 'fancy'
