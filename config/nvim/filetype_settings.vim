" All Files

" Remove trailing whitespaces on lines
autocmd BufWritePre * %s/\s\+$//e

" JS Related File types
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.es6 set ft=javascript

" Markdown File Settings
autocmd BufReadPre *.md setlocal textwidth=80
autocmd BufReadPre *.md setlocal spell spelllang=en_us

" Text File Settings
autocmd BufReadPre *.txt setlocal textwidth=80
autocmd BufReadPre *.txt setlocal spell spelllang=en_us

au BufReadPre * setlocal tabstop=2
au BufReadPre * setlocal shiftwidth=2

au BufReadPre *.elm setlocal tabstop=4
au BufReadPre *.elm setlocal shiftwidth=4

au BufReadPre *.ex nnoremap <leader>t :call ExTestToggle()<CR>
