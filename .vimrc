" .vimrc
"
" wbv's preferred vim defaults

" load any machine-specific customizations here
"   (reads config from ~/.vim/$hostname.vim)
let hostnamecfg = '~/.vim/' . system('hostname')[:-2] . '.vim'
if filereadable(hostnamecfg)
	source hostnamecfg
endif


" syntax highlighting, colors
syntax on
set background=dark

" line numbers
set number
set cursorline
set cursorlineopt=number
highlight LineNr ctermfg=DarkGray
highlight CursorLineNr ctermfg=White cterm=nocombine,bold

" set reasonable defaults
set textwidth=80
set shiftwidth=4 tabstop=4 " tab is '4' spaces wide
set noexpandtab            " but stored as a tab
set softtabstop=0          " and disable softtabs (default)

" per-filetype indentation rules
filetype plugin indent on

" highlight whitespace (tabs and trailing whitespace)
set list
"set listchars=tab:┊◦,trail:▚
"set listchars=tab:┊⸱,trail:▚
set listchars=trail:▚,nbsp:▚,tab:┊⸱

highlight SpecialKey ctermfg=DarkGray

""" per-filetype whitespace customizations, as desired

" TeX/LaTeX: two spaces
autocmd Filetype tex setlocal shiftwidth=2 tabstop=2 expandtab textwidth=100
