call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"Autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ervandew/supertab'

" Golang 
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Initialize plugin system
call plug#end()

let mapleader = ","

:nnoremap <C-P> :FZF <CR>
:nnoremap fmt :RustFmt <CR>
:nnoremap <C-S-F> :Find<Space> 
:map <F2> :NERDTreeToggle<CR>
:map gn :bn <CR>
:map gp :bp <CR>
:map <Leader> <Plug>(easymotion-prefix)
:nmap <F8> :TagbarToggle<CR>

set number
set hidden
set encoding=utf-8
set hlsearch
set ignorecase
set smartcase
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-k><C-d>'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=1

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

colo papaya

syntax on

set term=screen-256color
let g:airline#extensions#tabline#enabled = 1

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

" Golang 
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

au FileType go set softtabstop=2
au FileType go set sw=2
au FileType go set ts=2

let g:go_auto_type_info = 1
set updatetime=100

" Golang end


" Autocomplete features
set completeopt=longest,menuone " auto complete setting
let g:python3_host_prog = "/usr/bin/python3"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = '/home/yerken/go/bin/gocode'
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
" Autocomplete end 

" Syntastic features
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic end

" Rust 
let g:rustfmt_autosave = 1 
let g:racer_cmd = "/home/yerken/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:tagbar_type_rust = {
\ 'ctagstype' : 'rust',
\ 'kinds' : [
 \'T:types,type definitions',
 \'f:functions,function definitions',
 \'g:enum,enumeration names',
 \'s:structure names',
 \'m:modules,module names',
 \'c:consts,static constants',
 \'t:traits',
 \'i:impls,trait implementations',
\]
\}
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" Rust end
