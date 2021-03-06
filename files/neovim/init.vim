call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'junegunn/vim-easy-align'

" Ctrl-P
Plug 'kien/ctrlp.vim'

" BufExplorer
Plug 'jlanzarotta/bufexplorer'

" Golang
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

" Neomake
Plug 'neomake/neomake'

" Autopair
Plug 'jiangmiao/auto-pairs'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Ag the_silver_searcher
Plug 'Numkil/ag.nvim'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" Projectile analog.
Plug 'joonty/vim-sauce'

" Surrounds char/word/sentence by tag/symbols/parantheses
Plug 'tpope/vim-surround'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"PHP
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'evidens/vim-twig'
Plug 'vim-scripts/smarty-syntax'
Plug 'qbbr/vim-symfony'

Plug 'udalov/kotlin-vim'

" Indent guidelines
Plug 'Yggdroot/indentLine'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Emmet!
Plug 'mattn/emmet-vim'
"  Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

"NERDComennter
Plug 'scrooloose/nerdcommenter'

" Ruby
Plug 'tpope/vim-rake'

call plug#end()

nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

" Disable Arrow keys. Don't even think about them
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" UI
if $TERM == "xterm-256  color"
    set t_Co=256
endif

set background=dark
syntax on
color base16-3024

set termguicolors

set number relativenumber
set t_ut=
set tabstop=4
set shiftwidth=4
set nojoinspaces
set colorcolumn=120
set cursorline

set showcmd
set backspace=indent,eol,start
set hidden
set title "Coding Session :)"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
au FileType js set tabstop=2
au FileType js set shiftwidth=2

set autoread

let g:indentLine_color_term = 239

" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)

let g:deoplete#enable_at_startup = 1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$|(node_modules|bower|vendor|cache)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" Golang
let g:go_fmt_command = "goimports"
let g:deoplete#sources#go#gocode_binary = '/home/kovalenkoa/.go/bin'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:go_fmt_command = "goimports"
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:go_auto_type_info = 1
call deoplete#custom#set('go', 'rank', 9999)
au FileType go nmap <F12> <Plug>(go-def)
let g:go_snippet_engine = "neosnippet"

" Leader
let mapleader="\<SPACE>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>ob :CtrlPBuffer
" nnoremap <Leader><Space> :CtrlSpace<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Common development keys
nmap <Leader>dm :!make<CR>
" vim-go
augroup vg
    " au FileType go nmap <Leader>b :GoBuild<CR>
    " au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    au FileType go nmap <Leader>cr :GoCallers<CR>
    au FileType go nmap <Leader>ce :GoCallees<CR>
    au FileType go nmap <Leader>? :GoCoverageToggle<CR>
    au FileType go nmap <Leader>D :GoDefPop<CR>
    au FileType go nmap <Leader>v :GoImplements<CR>
    au FileType go nmap <Leader>I :GoImports<CR>
    au FileType go nmap <Leader>i :GoInstall<CR>
    au FileType go nmap <Leader>p :GoPlay<CR>
    au FileType go nmap <Leader>' :GoDocBrowser<CR>
    au FileType go nmap <Leader>b :GoToggleBreakpoint<CR>
    au FileType go nmap <Leader>db :GoDebug<CR>
    au FileType go nmap <Leader>e :Refactor extract
    au FileType go nmap <leader>rt <Plug>(go-run-tab)
    au FileType go nmap <Leader>rs <Plug>(go-run-split)
    au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

    " synced with emacs
    au FileType go nmap <Leader>,, :GoAlternate<CR>
    au FileType go nmap <Leader>T :GoTestFunc
    au FileType go nmap <Leader>t :GoTest
    au FileType go nmap <Leader>r :GoReferrers<CR>
    au FileType go nmap <Leader>cp :GoChannelPeers<CR>
    au FileType go nmap <Leader>d :GoDef<CR>
    au FileType go nmap <Leader>k :GoInfo<CR>
    au FileType go nmap <Leader>B :!go build<CR>

    " Git
    nmap <Leader>gb :Gblame<CR>
    nmap <Leader>gc :Gcommit<CR>
    nmap <Leader>gm :Magit<CR>

    " Ctags
    nmap <Leader>ct :!ctags -R<CR>

    " Ruby TODO: Add Ruby Leader binding

    " Buffers
    nnoremap <C-n> :bnext<CR>
    nnoremap <C-p> :bprevious<CR>
    nmap <Leader>bb :BufExplorer<CR>
    nmap <Leader><Tab> :bnext<CR>
    nmap <Leader>bd :bd<CR>
    nmap <Leader>bk :bnext<CR>
    nmap <Leader>bj :bprevious<CR>

    set ignorecase          " Make searching case insensitive
    set smartcase           " ... unless the query has capital letters.
    set gdefault            " Use 'g' flag by default with :s/foo/bar/.

    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
    endif

    " Search and Replace
    nmap <Leader>s :%s//g<Left><Left>
    " Relative numbering
    function! NumberToggle()
        if(&relativenumber == 1)
            set nornu
            set number
        else
            set rnu
        endif
    endfunc

    set rnu
    nnorema ; :
    nnoremap Q @q


    let g:airline_theme = 'one'
    let g:airline#extensions#tabline#enabled = 1 
    let g:airline#extensions#tabline#fnamemod = ':t'
