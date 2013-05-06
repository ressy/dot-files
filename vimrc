syntax enable
filetype plugin indent on
set fileencoding=utf8
set encoding=utf8
set textwidth=0
set wrapmargin=0
set mouse=a           " mouse support
set number            " line numbering
set scrolloff=5       " always keep some lines above/below the cursor
set ruler             " show current position in file on lower right
set hlsearch          " highlight search results
set cursorline        " show current line with a horizontal rule
set incsearch         " update search results while typing
set pastetoggle=<F2>  " don't automatically indent when pasting!
set t_Co=256          " Support 256 colors
colorscheme wombat256 " Alternate color scheme

""" HTML Settings
au BufNewFile,BufRead *.htm  set filetype=html
au BufNewFile,BufRead *.html set filetype=html
autocmd FileType html set autoindent
autocmd FileType html set expandtab 
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2
autocmd FileType html set shiftwidth=2

""" Ruby settings
au BufNewFile,BufRead *.erb set filetype=eruby
autocmd FileType ruby set autoindent
autocmd FileType ruby set expandtab 
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2


""" Python settings
autocmd FileType python set foldmethod=indent
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.\+/
