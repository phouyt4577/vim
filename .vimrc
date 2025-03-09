syn on
set syntax =on
filetype indent plugin on


" For dark version.
set background=dark


" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'

" For better performance
let g:everforest_better_performance = 1

colorscheme everforest

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


function! MyFoldFunction()
	let line = getline(v:foldstart)
	let sub = substitute(line,'/\*\|\*/\|^\s+', '', 'g')
	let lines = v:foldend - v:foldstart + 1
	return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
endfunction

set foldmethod =syntax
set foldtext =MyFoldFunction()


set hls 

set mouse=a
