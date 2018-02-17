call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

" Install Rust support 
Plug 'rust-lang/rust.vim' 
Plug 'racer-rust/vim-racer'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }


" Initialize plugin system
call plug#end()

:nnoremap <C-P> :FZF <CR>
:nnoremap fmt :RustFmt <CR>
:nnoremap <C-_> :vsplit <CR>
:nnoremap <C-L> :Buffers <CR>
:nnoremap <C-S-F> :Find<Space> 
:map <F2> :NERDTreeToggle<CR>
:map gn :bn <CR>
:map gp :bp <CR>
:map ,<C-w> :bd <CR>


au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap <C-B> <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

set number
set hidden
set encoding=utf-8
set hlsearch
set ignorecase
set smartcase
let g:racer_cmd = "/home/koashen/.cargo/bin/racer" 
let g:racer_experimental_completer = 1
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = "/usr/bin/python3"
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-k><C-d>'
let g:multi_cursor_exit_from_visual_mode=0

let g:ackprg = 'ag --nogroup --nocolor --column'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


colo dracula
syntax on

set term=screen-256color

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
