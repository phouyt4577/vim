"""====================================================
"         Configuration Vim
"====================================================

" === Syntaxe et Type de Fichier ===
syntax on                 " Active la coloration syntaxique
filetype plugin indent on " Active la détection et l'indentation automatique

" === Affichage ===
set number                " Affiche les numéros de ligne
set relativenumber        " Active les numéros relatifs
set showmatch             " Met en surbrillance les parenthèses et accolades correspondantes
set incsearch             " Active la recherche incrémentale

" === Indentation et Tabulation ===
set tabstop=2             " Définit la largeur d'une tabulation à 2 espaces
set shiftwidth=2          " Définit l'indentation à 2 espaces
set softtabstop=2         " Rend la tabulation cohérente avec shiftwidth
set laststatus=2          " Affiche la barre de statut en permanence

" === Pliage de Code ===
function! MyFoldFunction()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|^\s+', '', 'g')
  let lines = v:foldend - v:foldstart + 1
  return v:folddashes . sub . '...' . lines . ' Lines...' . getline(v:foldend)
endfunction

set foldmethod=syntax      " Utilise la syntaxe pour plier le code
set foldtext=MyFoldFunction() " Utilise la fonction personnalisée pour afficher les plis

" === Divers ===
set hls                   " Active la mise en surbrillance des résultats de recherche
set mouse=a               " Active la prise en charge de la souris
set switchbuf+=usetab,newtab " Ouvre les buffers dans un nouvel onglet si possible

" === Support des couleurs ===
if has('termguicolors')
  set termguicolors       " Active le support des couleurs améliorées
endif

set background=dark       " Définit un fond sombre
let g:everforest_background = 'medium' " Définit le contraste du thème
let g:everforest_better_performance = 1 " Améliore les performances
colorscheme everforest    " Applique le thème Everforest

" === Plugins (via Vim-Plug) ===
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' " Explorateur de fichiers
Plug 'tribela/vim-transparent' " Rend Vim transparent (utile pour les terminaux)
Plug 'sheerun/vim-polyglot' " Support amélioré de la syntaxe pour plusieurs langages
Plug 'tpope/vim-fugitive' " Intégration avec Git
Plug 'dense-analysis/ale' " Outil de linting et correction automatique
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
call plug#end()

" === Raccourcis Clavier ===
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap ; :Files<CR>
nnoremap <C-i> :ALEGoToImplementation<CR>
nnoremap <C-d> :ALEGoToDefinition<CR>
nnoremap ] $
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nmap <F8> :TagbarToggle<CR>

" === Configuration de Airline ===
function! MyTagbarContext()
    let l:class = tagbar#currenttag('%s', '', 'c')  " Récupère uniquement les classes
    let l:function = tagbar#currenttag('%s', '', 'f')  " Récupère uniquement les fonctions

    if l:class != '' && l:function != ''
        return l:class . ' -> ' . l:function
    elseif l:function != ''
        return l:function
    elseif l:class != ''
        return l:class
    else
        return ''
    endif
endfunction
let g:airline_section_c = '%{MyTagbarContext()}'

" === Configuration de Tagbar ===
let g:tagbar_ctags_bin = '$HOME/.local/bin/ctags'
let g:tagbar_sort = 0
