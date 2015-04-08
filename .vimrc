execute pathogen#infect()

syntax on

set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set expandtab " Allows tab to be equivalent to 4 spaces
set mouse=a

filetype indent on
filetype on
filetype plugin on

" For code folding
set foldmethod=manual
set foldlevel=99

" Settings for molokai color scheme
" set t_Co=256
" set background=dark
" let g:molokai_original = 1 
" let g:rehash256 = 1
" colorscheme molokai

" Settings for solarized scheme
colorscheme solarized
set background=dark


let mapleader=","

set cursorline
set ignorecase      " ignore case when searching
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set noerrorbells
set notitle         " don't show "Thanks for flying vim"
set nowrap          " stop lines from wrapping
set number
set numberwidth=4   " line numbering takes up 5 spaces
set shortmess=atI   " Abbreviate messages
set ttyfast         " smoother changes
set visualbell

" set cursorline to center vertically
set so=9999

" Clear search by hitting space
" nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Clear search by hitting enter
:nnoremap <CR> :nohlsearch<cr>

" show extraneous spaces and where tabs are
set list listchars=tab:>.,trail:·,eol:¬ " mark trailing white space

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" more informative status line
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%F%m%r%h%w

  " Add fugitive
  set statusline+=\ %{fugitive#statusline()}

  set statusline+=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

  " Add syntastic if enabled
  set statusline+=\ %#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

map ,c :s/^/# /<CR>
map ,u :s/^# //<CR>

" Sparkup configs
let g:sparkup = 'sparkup'
let g:sparkupArgs = '--no-last-newline'
"let g:sparkupExecuteMapping = ''
"let g:sparkupNextMapping = ''


