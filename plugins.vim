" showmarks
let g:showmarks_enable = 0 " disabled by default by populardemand ;)
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" nerdtree
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>


" nerdcommenter
" ,/ to invert comment on the current line/selection
nmap <leader>c :call NERDComment(0, "invert")<cr>
vmap <leader>c :call NERDComment(0, "invert")<cr>


" Tag Window
map <silent> <F5>:!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
nnoremap <silent> <F8> :TlistToggle<CR>


" sessionman
nmap <leader>S :SessionList<CR>
nmap <leader>SS :SessionSave<CR>
nmap <leader>SA :SessionSaveAs<CR>

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1
let g:bufExplorerSortBy = "name"
autocmd BufRead,BufNew :call UMiniBufExplorer


let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'
" ,sh shell window
nmap <Leader>sh :ConqueSplit bash<cr>
" ,r run command
nmap <Leader>R :ConqueSplit

" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" ,y to show the yankring
nmap <leader>y :YRShow<cr>

" rails
" completing Rails hangs a lot
let g:rubycomplete_rails = 1

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1
nmap <unique> <silent> <Leader><Leader> :CommandT<CR>

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc


" Fugitive
" ,e for Ggrep
nmap <leader>g :Ggrep


"RI Browser
nnoremap <silent> <unique> <F2> <Esc>:call<Space>PA_ri(expand('<cword>'))<CR>|              " it gets `ri` for undercursor word in NORMAL mode
vnoremap <silent> <unique> <F2> <Esc>:call<Space>PA_ri(substitute(@0, '\n', '', 'g'))<CR>| " it gets `ri` for selected words in VISUAL mode

" Ack
" ,k for Ack
let g:ackprg="ack-grep -H --nocolor --nogroup"
nmap <leader>k :Ack 

" vim-indentobject
" add Markdown to the list of indentation based languages
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

"snipmate setup
try
  source ~/.vim/snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

    "if we're in a rails env then read in the rails snippets
    if filereadable("./config/environment.rb")
      try
        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
      catch
        call ExtractSnips("~/vimfiles/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/vimfiles/snippets/eruby-rails", "eruby")
      endtry
    endif

    try
      call ExtractSnips("~/.vim/snippets/html", "eruby")
      call ExtractSnips("~/.vim/snippets/html", "xhtml")
      call ExtractSnips("~/.vim/snippets/html", "php")
    catch
      call ExtractSnips("~/vimfiles/snippets/html", "eruby")
      call ExtractSnips("~/vimfiles/snippets/html", "xhtml")
      call ExtractSnips("~/vimfiles/snippets/html", "php")
    endtry
endfunction

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

