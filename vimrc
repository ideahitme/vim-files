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
:nnoremap <C-S-F> :Find<Space> 
:map gn :bn <CR>
:map gp :bp <CR>
:map <Leader> <Plug>(easymotion-prefix)
:nmap <F8> :TagbarToggle<CR>
:nmap <F2> :NERDTreeToggle<CR>

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
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

au FileType go set softtabstop=2
au FileType go set sw=2
au FileType go set ts=2

let g:go_auto_type_info = 1
set updatetime=100
" Golang end


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


" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#disable()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#enable')
        exe 'call deoplete#enable()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction
