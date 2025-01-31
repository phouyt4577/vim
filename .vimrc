syn on
set syntax =on
filetype indent plugin on


" For dark version.
set background=dark

set number 
set relativenumber 
set showmatch
set incsearch

"set wildmenu
"set wildmode =list:longest,list:full
"set wildignore =*.o,*.r,*.so,*.sl,*.tar,*.tgz

set tabstop =2
set shiftwidth =2
set softtabstop =2
set laststatus =2

function! MyFoldFunction()
	let line = getline(v:foldstart)
	let sub = substitute(line,'/\*\|\*/\|^\s+', '', 'g')
	let lines = v:foldend - v:foldstart + 1
	return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
endfunction

set foldmethod =syntax
set foldtext =MyFoldFunction()

colorscheme everforest

set hls 

set mouse=a

"plugin"
call plug#begin()

" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tribela/vim-transparent'
Plug 'sainnhe/everforest'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
"Plug 'valloric/youcompleteme'
call plug#end()

map <C-o> :NERDTreeToggle<CR> 
map ; :Files<CR>
map <C-i> :ALEGoToImplementation<CR>

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

set switchbuf+=usetab,newtab
