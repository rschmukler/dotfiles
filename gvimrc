source ~/.vim/plugin_config.vim

" Resize Splits on Vim Resize
if has("gui_running")
  autocmd VimResized * wincmd =
end

set guioptions=aAce
set transparency=5
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set t_Co=256
color base16-tomorrow
