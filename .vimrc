" change leader key
let mapleader = ","

" loaded vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'fatih/vim-go'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set nu
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set nowrap
set showmode
set smarttab
set relativenumber

" add Powerline
"set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" ============ vim-go setting ===============
" follow https://github.com/fatih/vim-go-tutorial
" set gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }
" execute GoImports on save
let g:go_fmt_command = "goimports"
" auto check
let g:go_metalinter_autosave = 1
" beautify go file
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
" identifier highlight
" let g:go_auto_sameids = 1

" jump between errors in quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" execute go-build & go-run with shortkey
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>d :GoDecls<CR>
autocmd FileType go nmap <leader>D :GoDeclsDir<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" =============== end vim-go setting =========

set background=dark
colorscheme gruvbox
let g:airline_powerline_fonts = 1

" ========= Find settings: ctrlp, funky, ctrlSF plugins =========
" key bindings for ctrlp-funky
nnoremap <leader>fu :CtrlPFunky<Cr>
" S is super, search all in one time
nnoremap <leader>fS :CtrlPMixed<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fn <Plug>CtrlSFCwordPath
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <leader>ft <Esc>:CtrlSFToggle<CR>
" ============== End Find settings ===========================

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
