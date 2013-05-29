" Resize Splits on Vim Resize
source ~/.vim/plugin_config.vim

if has("gui_running")
  autocmd VimResized * wincmd =
end

set guioptions=aAce
set transparency=5
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
