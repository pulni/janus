

source ~/.vim/global.vim
source ~/.vim/bindings.vim
source ~/.vim/plugins.vim

if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif
