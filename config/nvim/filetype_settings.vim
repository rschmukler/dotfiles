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
