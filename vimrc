syntax enable
filetype plugin indent on
set laststatus=2      " always show status line
set fileencoding=utf8
set encoding=utf8
set textwidth=0
set wrapmargin=0
"set mouse=a           " mouse support
set number            " line numbering
set scrolloff=5       " always keep some lines above/below the cursor
set ruler             " show current position in file on lower right
set hlsearch          " highlight search results
set cursorline        " show current line with a horizontal rule
set incsearch         " update search results while typing
set pastetoggle=<F2>  " don't automatically indent when pasting!
set t_Co=256          " Support 256 colors
colorscheme wombat256 " Alternate color scheme
set vb t_vb=          " No bell.  I hate the bell.
set nobackup          " Don't do the filename~ thing.
set noundofile        " ... or the filename.un~ thing.

" Quick-fix command for uses spaces in shell scripts
command Shsp :set expandtab |:set tabstop=4 |:set softtabstop=4 |:set shiftwidth=4

""" HTML Settings
au BufNewFile,BufRead *.htm  set filetype=html
au BufNewFile,BufRead *.html set filetype=html
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.liquid set filetype=html
autocmd FileType html set autoindent
autocmd FileType html set expandtab
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2
autocmd FileType html set shiftwidth=2

au BufNewFile,BufRead *.css.liquid set filetype=css
au BufNewFile,BufRead *.js.liquid set filetype=javascript

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

""" YAML settings
autocmd FileType yaml set ff=unix
autocmd FileType yaml set ts=2
autocmd FileType yaml set sw=2
autocmd FileType yaml set ai
autocmd FileType yaml set expandtab

""" Diagram settings
au BufNewFile,BufRead *.diag set filetype=diagram
autocmd FileType diagram set autoindent
autocmd FileType diagram set expandtab
autocmd FileType diagram set tabstop=2
autocmd FileType diagram set softtabstop=2
autocmd FileType diagram set shiftwidth=2

""" POVray settings
autocmd FileType pov set autoindent
autocmd FileType pov set expandtab
autocmd FileType pov set tabstop=2
autocmd FileType pov set softtabstop=2
autocmd FileType pov set shiftwidth=2

""" Snakemake settings
au BufNewFile,BufRead Snakefile   set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.rules     set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snake     set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.smk       set syntax=snakemake filetype=snakemake
autocmd FileType snakemake set autoindent
autocmd FileType snakemake set expandtab
autocmd FileType snakemake set tabstop=4
autocmd FileType snakemake set softtabstop=4
autocmd FileType snakemake set shiftwidth=4

""" R settings
autocmd FileType r set ts=2
autocmd FileType r set sw=2
autocmd FileType r set ai
autocmd FileType r set expandtab

""" Code Folding
" http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.\+/

" https://github.com/vim-syntastic/syntastic
execute pathogen#infect()
