" Ctrl-P
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

let g:ctrlp_map = '<D-t>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <D-t> :CtrlP<CR>

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

" PowerLine
let g:Powerline_symbols = 'fancy'
