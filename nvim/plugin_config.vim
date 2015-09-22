set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules,lib-cov,public,bower_components,dist,built,typings


"""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''built'' --ignore ''typings'' --hidden -g ""'
endif

if executable("sift")
  set grepprg=sift\ --no-color
  let g:agprg="sift --line-number --binary-skip"
  let g:agformat="%f:%l:%m"
endif


let g:ctrlp_working_path_mode = 2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap π :CtrlPCurFil<CR>
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""
" Flow
"""""""""""""""""""""""""""
let g:flow#enable = 0

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

""""""""""""""""""""
"  Limelight
""""""""""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_html_checkers = []
" let g:syntastic_javascript_checkers = ['eslint']
" nnoremap <Leader>{ :lprev<CR>
" nnoremap <Leader>} :lnext<CR>

"""""""""""""""""""""""""""
" Neomake
"""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake

let g:neomake_typescript_tsc_maker= {
  \ 'args': [
  \ '--noEmit', '-t', 'ES6'
  \ ],
  \ 'errorformat':
  \ '%E%f %#(%l\,%c): error %m,' .
  \ '%E%f %#(%l\,%c): %m,' .
  \ '%Eerror %m,' .
  \ '%C%\s%\+%m'
\ }

let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'Question',
            \ }

function! <SID>LocationPrevious()                       
  try                                                   
    lprev                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    llast                                               
  endtry                                                
endfunction                                             

function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  endtry                                                
endfunction                                             

nnoremap <Leader>[ :call <SID>LocationPrevious()<CR>
nnoremap <Leader>] :call <SID>LocationNext()<CR>

""""""""""""""""""""
"  SyntaxComplete
""""""""""""""""""""
 if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif

""""""""""""""""""""
"  Tablular
""""""""""""""""""""
nmap <leader>a :Tab<CR>

""""""""""""""""""""
"  Tmux Navigator
""""""""""""""""""""
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

""""""""""""""""""""
"  Tern
""""""""""""""""""""
let g:tern_map_keys=1

""""""""""""""""""""
"  Tsuquyomi
""""""""""""""""""""
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Space>t : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_disable_quickfix = 1

