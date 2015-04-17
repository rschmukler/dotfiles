"""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""
if isdirectory("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/")
	python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages")
	python from powerline.vim import setup as powerline_setup
	python powerline_setup()
	python del powerline_setup
endif

"""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""
nnoremap <leader>c :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
\ }

"""""""""""""""""""""""""""
" Ctrl-P
"""""""""""""""""""""""""""
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules,lib-cov,public,bower_components,dist

let g:ctrlp_working_path_mode = 2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <D-t> :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""
" Indent Guides
"""""""""""""""""""""""""""
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1

"""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0
autocmd vimenter * if !argc() | NERDTree | wincmd l | endif
let NERDTreeIgnore=['^components/', '^node_modules/', '^bower_components/', '^dist/']

"""""""""""""""""""""""""""
" Supertab
"""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"""""""""""""""""""""""""""
" PowerLine
"""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""
let g:markdown_fenced_languages = ['coffee', 'css', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'styl=stylus']

"""""""""""""""""""""""""""
" Javascript plugins
"""""""""""""""""""""""""""

"au FileType javascript call JavaScriptFold()
let g:used_javascript_libs = 'lodash,angularjs,jquery'

"""""""""""""""""""""""""""
" Goyo
"""""""""""""""""""""""""""
nnoremap <Leader>g :Goyo<CR>

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint']
nnoremap <Leader>{ :lprev<CR>
nnoremap <Leader>} :lnext<CR>

""""""""""""""""""""
"  SyntaxComplete
""""""""""""""""""""
 if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif
