filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start

set foldenable                  " Auto fold code

set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
  " See also: autoload/settings.vim 802 version settings

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set noswapfile

" switch cwd
autocmd BufEnter * silent! lcd %:p:h
