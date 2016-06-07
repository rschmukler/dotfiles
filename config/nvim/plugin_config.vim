set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules,lib-cov,public,bower_components,dist,built,typings,vendor

"""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""
" Echodoc
"""""""""""""""""""""""""""
let g:echodoc_enable_at_startup = 1


"""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'


"""""""""""""""""""""""""""
" CtrlP + Ack
"""""""""""""""""""""""""""
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''built'' --ignore ''typings'' --hidden -g ""'
endif

if executable("sift")
  set grepprg=sift\ --no-color
  let g:ag_prg="sift --line-number --binary-skip"
  let g:ag_format="%f:%l:%m"
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
" Powerline
"""""""""""""""""""""""""""
nnoremap <leader>m :TagbarToggle<CR>

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
autocmd! BufWritePost *_test.go Neomake gotest

let g:neomake_open_list = 0

let g:neomake_typescript_tsc_maker= {
  \ 'args': [ '--noEmit' ],
  \ 'append_file': 0,
  \ 'errorformat':
    \ '%E%f %#(%l\,%c): error %m,' .
    \ '%E%f %#(%l\,%c): %m,' .
    \ '%Eerror %m,' .
    \ '%C%\s%\+%m'
\ }

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_javascript_enabled_makers = ['eslint']



let g:neomake_go_enabled_makers = ['go', 'govet', 'golint']
let g:neomake_go_go_maker = {
    \ 'exe': 'sh',
    \ 'args': ['-c', 'go build -o ' . neomake#utils#DevNull() . ' ./\$0', '%:h'],
    \ 'errorformat':
        \ '%W%f:%l: warning: %m,' .
        \ '%E%f:%l:%c:%m,' .
        \ '%E%f:%l:%m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G#%.%#'
    \ }

let g:neomake_go_golint_maker = {
    \ 'exe': 'golint',
    \ 'cwd': '%:h',
    \ 'errorformat':
        \ '%W%f:%l:%c: %m,' .
        \ '%-G%.%#'
    \ }

let g:neomake_go_gotest_maker = {
    \ 'exe': 'sh',
    \ 'args': ['-c', 'go test ./\$0', '%:h'],
    \ 'errorformat':
        \ '%W%f:%l: warning: %m,' .
        \ '%E%f:%l:%c:%m,' .
        \ '%E%f:%l:%m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G#%.%#'
    \ }

let g:neomake_rust_cargo_maker = {
      \ 'exe': 'cargo',
      \ 'args': ['rustc', '--', '-Z', 'no-trans' ],
      \ 'append_file': 0,
      \ 'errorformat':
      \   '%E%f:%l:%c: %\d%#:%\d%# %.%\{-}error:%.%\{-} %m,'   .
      \   '%E%f:%l:%c: %\d%#:%\d%# %.%\{-}error: %m,'   .
      \   '%W%f:%l:%c: %\d%#:%\d%# %.%\{-}warning:%.%\{-} %m,' .
      \   '%W%f:%l:%c: %\d%#:%\d%# %.%\{-}warning: %m,' .
      \   '%Z%f:%l %m,' .
      \   '%C%f:%l %m,' .
      \   '%C   %m,' .
      \   '%C%m,' .
      \   '%-Z%.%#'
      \ }

if filereadable("Cargo.toml")
  let g:neomake_rust_enabled_makers = ['cargo']
else
  let g:neomake_rust_enabled_makers = ['rustc']
endif

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
au FileType typescript nmap <Leader>d :TsuDefinition<CR>
let g:tsuquyomi_disable_quickfix = 1

""""""""""""""""""""
"  Typescript
""""""""""""""""""""
let g:typescript_enable_domhtmlcss = 1

"""""""""""""""""""
"  Markdown
"""""""""""""""""""
let g:vim_markdown_folding_disabled=1

"""""""""""""""""""
"  vim-go
"""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>d <Plug>(go-doc)
au FileType go nmap <leader>l <Plug>(go-def)
au FileType go nmap <leader>t <Plug>(go-info)
au FileType go nmap <leader>i :GoImports<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
" let g:go_auto_type_info = 1



"""""""""""""""""""
"  Rust and Vim Racer
"""""""""""""""""""
let g:racer_cmd = "/Users/ryan/.multirust/toolchains/nightly/cargo/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/nightly"
au FileType rust nmap <Leader>d :call RacerGoToDefinition()<CR>
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

au FileType rust command! Nofmt set paste | normal O#[cfg_attr(rustfmt, rustfmt_skip)]<ESC>:set nopaste<CR>^j
au FileType rust nmap <Leader>i :Nofmt<CR>
au FileType rust nmap <Leader>r :RustRun<CR>

"""""""""""""""""""
"  JS PrettyFormat
"""""""""""""""""""
au FileType typescript nmap <Leader>th :JsPreTmpl html<CR>
au FileType typescript nmap <Leader>tc :JsPreTmpl scss<CR>
au FileType javascript nmap <Leader>th :JsPreTmpl html<CR>
au FileType javascript nmap <Leader>tc :JsPreTmpl scss<CR>

"""""""""""""""""""""""""""
" neco-ghc
"""""""""""""""""""""""""""
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<c-w>"
