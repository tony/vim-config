if executable('ag')
  Plug 'rking/ag.vim', { 'on': ['Ag'] }
endif

Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

Plug 'chriskempson/base16-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'bkad/CamelCaseMotion'
Plug 'rhysd/vim-clang-format', {
	\ 'for': ['c', 'cpp']
      \}
" [sudo] gem install CoffeeTags
Plug 'lukaszkorecki/CoffeeTags', {
  \ 'for':['coffee', 'haml'],
\}

Plug 'Shougo/echodoc'
Plug 'octol/vim-cpp-enhanced-highlight',
	\ { 'for': 'cpp' }
if executable('xbuild')
  Plug 'OmniSharp/omnisharp-vim', {
      \   'for': 'cs',
      \   'do': 'cd server; xbuild'
      \ }
endif
Plug 'hail2u/vim-css3-syntax', {
      \   'for' : ['css', 'less'],
      \}

" Note: despite the name, vim-haml provides Haml, Sass, and SCSS
Plug 'tpope/vim-haml', {
      \   'for' : 'scss',
      \ }

" NeoBundle 'editorconfig/editorconfig-vim' doesn't support scanning project
" upwards for .editorconfig, use dahus
" Plug 'dahu/EditorConfig'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

if executable('git')
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
endif

if executable('go')
  Plug 'fatih/vim-go', {
	\ 'for': 'go'
	\ }
endif
"
"" haskell
"
if executable('ghc-mod')
  Plug 'dag/vim2hs', {
  	\ 'for': 'haskell'
        \ }


  Plug 'eagletmt/ghcmod-vim', {
  	\ 'for': 'haskell'
        \ }

  Plug 'ujihisa/neco-ghc', {
  	\ 'for': 'haskell'
        \ }

  Plug 'Twinside/vim-hoogle', {
  	\ 'for': 'haskell'
        \ }

  Plug 'carlohamalainen/ghcimportedfrom-vim', {
  	\ 'for': 'haskell'
        \ }
endif
Plug 'othree/html5-syntax.vim', {
      \     'for' : ['html', 'xhtml', 'jst', 'ejs']
      \   }
if executable('i3')
  Plug 'PotatoesMaster/i3-vim-syntax', {
	\ 'for': 'i3'
        \ }
endif
" features
Plug 'nathanaelkane/vim-indent-guides' " color indentation

if has('conceal')
  Plug 'Yggdroot/indentLine'
endif

if executable('java')
  Plug 'tpope/vim-classpath', {
  	\ 'for': ['java', 'clojure']
        \ }
endif

Plug 'briancollins/vim-jst'

Plug 'mklabs/vim-backbone', { 'for': 'javascript' }
Plug 'posva/vim-vue'

Plug 'mxw/vim-jsx'

" https://github.com/flowtype/vim-flow/issues/60
Plug 'flowtype/vim-flow', {
  \ 'autoload': {
  \   'filetypes': 'javascript'
  \ },
  \ 'build': {
  \   'mac': 'npm install -g flow-bin'
  \ }}
let g:flow#flowpath = '$(npm bin)/flow'

Plug 'Shutnik/jshint2.vim'

Plug 'elzr/vim-json', {
      \ 'autoload' : {
      \   'filetypes' : 'javascript',
      \ }}


Plug 'pangloss/vim-javascript', {
      \ 'autoload' : {
      \   'filetypes' : ['javascript', 'jsx']
      \ }}

if executable('node')
  function! NpmInstall(info)
	  if a:info.status == 'installed' || a:info.force
		      !npm install
		        endif
  endfunction
  " Plug 'ternjs/tern_for_vim', { 
  "       \ 'do': function('NpmInstall') ,
  "       \ 'for': ['javascript', 'javascript.jsx'],
  "       \ }
  "
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

  Plug 'maksimr/vim-jsbeautify', {
        \ 'for' : ['javascript', 'html', 'mustache', 'css', 'less', 'jst']
        \ }

  Plug 'einars/js-beautify', { 'do': function('NpmInstall') }

  Plug 'ramitos/jsctags', { 'do': function('NpmInstall') }
endif

if executable('tsc')
  Plug 'Quramy/tsuquyomi'

  Plug 'leafgarland/typescript-vim'
endif
" Disable plugins for LargeFile
Plug 'vim-scripts/LargeFile'
if executable('latex')
  Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': ['tex', 'latex'] }
endif
Plug 'groenewege/vim-less', { 'for': 'less' }
if executable('lua')
  Plug 'xolox/vim-lua-ftplugin' , {
        \ 'for' : 'lua',
        \ } | Plug 'xolox/vim-misc',
endif
Plug 'tomasr/molokai'
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
if executable('nginx')
  Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx'}
endif

if executable('node')
  Plug 'mklabs/grunt', {
      \ 'for': 'javascript'
      \ }
endif
if executable('php')
  Plug 'StanAngeloff/php.vim'
  Plug 'xsbeats/vim-blade', { 'for': 'blade' }
endif

Plug 'tpope/vim-eunuch', {
      \   'on': [
      \     'Unlink',
      \     'Remove',
      \     'Move',
      \     'Rename',
      \     'Chmod',
      \     'Mkdir',
      \     'Find',
      \     'Locate',
      \     'SudoEdit',
      \     'SudoWrite',
      \     'W'
      \   ],
      \}
Plug 'tpope/vim-dispatch', {
      \   'on': [
      \     'Make',
      \     'Start',
      \     'Copen',
      \     'Dispatch',
      \     'FocusDispatch'
      \   ]
      \}
if executable('python')
  " Plug 'davidhalter/jedi-vim', {
  "       \   'for' : 'python',
  "       \ }

  Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
  "Plug 'tony/python-mode', {
  "      \ 'rev': 'python3',
  Plug 'klen/python-mode', {
        \ 'branch': 'develop',
        \   'for' : ['python', 'python3', 'djangohtml'],
        \ }

  Plug 'nvie/vim-flake8', {
        \   'for' : ['python', 'python3', 'djangohtml'],
        \ }

  " Plug 'google/yapf', {
  "       \ 'autoload' : {
  "       \   'filetypes' : 'python',
  "       \ },
  "       \ 'build': {
  "       \   'unix': 'pip install --user -e .',
  "       \ },
  "       \ 'rtd': "~/.vim/bundle/yapf/plugins",
  "       \ 'script_type': 'plugin'
  "       \ }

  " Plug 'ehamberg/vim-cute-python', 'moresymbols', {
  "        \   'for' : ['python', 'python3', 'djangohtml'],
  "      \ }
  "     \ 'autoload': {
  "     \   'filetypes': 'python',
  "     \ },
  "     \ 'disabled': !has('conceal'),
  " \ }

  Plug 'tell-k/vim-autopep8', {
        \ 'for' : 'python',
        \ }
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'Vim-scripts/django.vim'

  Plug 'fisadev/vim-isort'
endif
" Fork of NeoBundle 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow' 
Plug 'Rykka/riv.vim'
" https://github.com/Rykka/riv.vim/issues/42
" No For option: https://github.com/Rykka/riv.vim/issues/64#issuecomment-184963060
" See settings/tagbar.vim for config
Plug 'jszakmeister/rst2ctags'
if executable('ruby')
  " Plug 'bbommarito/vim-slim'
  Plug 'slim-template/vim-slim'
  Plug 'wavded/vim-stylus'
  if executable('ruby')
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'tpope/rbenv-ctags', { 'for': 'ruby' }
    Plug 'tpope/vim-rbenv', { 'for': 'ruby' }

    Plug 'skwp/vim-rspec', { 'for': ['ruby', 'eruby', 'haml'] }
    " Plug 'ruby-matchit', { 'for': ['ruby', 'eruby', 'haml'] }
  endif

endif
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'phildawes/racer', { 'do': 'cargo build --release', 'for': 'rust' }

  let g:racer_cmd = "~/.vim/bundle/racer"
endif

if executable('salt-call')
  Plug 'saltstack/salt-vim', { 'for': 'sls' }
endif
""" Decommissioning, keep getting problems with this
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
" Vim plugin that displays tags in a window, ordered by class etc.
Plug 'majutsushi/tagbar'

" Conflicts with airline (race condition loading)
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'mustache/vim-mustache-handlebars', {
      \   'for': ['html', 'mustache', 'hbs']
      \ }

Plug 'itchyny/lightline.vim'

Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' } " extended typescript support - works as a client for TSServer
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'kchmck/vim-coffee-script', {'for':['coffee', 'haml']}
Plug 'takac/vim-hardtime'
Plug 'nelstrom/vim-markdown-folding', {'for':['markdown']}
Plug 'tpope/vim-markdown', {'for':['markdown']}
Plug 'airblade/vim-rooter'
" Heuristically set buffer options
Plug 'tpope/vim-sleuth'
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'markcornick/vim-vagrant'
Plug 'chaoren/vim-wordmotion'
Plug 'syngan/vim-vimlint' | Plug 'ynkdir/vim-vimlparser' 
Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
