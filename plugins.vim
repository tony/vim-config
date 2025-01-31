" OPTIONALLY: auto-download vim-plug if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  echo "Downloading vim-plug to ~/.vim/autoload/plug.vim"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------------------------------------
" Helper Function: Conditionally load a plugin if an executable is found
"------------------------------------------------------------------------------
function! PlugIfCommand(cmd, plugin_spec, ...) abort
  if executable(a:cmd)
    if !empty(a:000)
      Plug a:plugin_spec, a:000[0]
    else
      Plug a:plugin_spec
    endif
  endif
endfunction

"------------------------------------------------------------------------------
" Begin Plugin Section
"------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Unconditional Plugins
Plug 'qpkorr/vim-bufkill'
Plug 'editorconfig/editorconfig-vim'

" fzf + fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'

" JSON5
Plug 'GutenYe/json5.vim'

" Unix helpers (e.g., :Move, :Rename, etc.)
Plug 'tpope/vim-eunuch'

" ALE linting
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0

" Comments
Plug 'tomtom/tcomment_vim'

" Mustache / Handlebars
Plug 'mustache/vim-mustache-handlebars', {
      \ 'for': ['html', 'mustache', 'hbs']
      \ }

" Markdown
Plug 'tpope/vim-markdown', {'for': ['markdown']}

" Root dir detection
Plug 'airblade/vim-rooter'

" Extra syntax for C/C++
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }

" Word motion
Plug 'chaoren/vim-wordmotion'

" Colorschemes
Plug 'rainux/vim-desert-warm-256'
Plug 'morhetz/gruvbox'
" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" NERDTree
Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1

" GraphQL
Plug 'jparise/vim-graphql'

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" JSON for GitHub Actions
Plug 'yasuhiroki/github-actions-yaml.vim'

" Autoformat
Plug 'vim-autoformat/vim-autoformat'
let g:formatdef_dprint = '"dprint stdin-fmt --file-name ".@%'
let g:formatters_json = ['dprint']
let g:formatters_toml = ['dprint']

" Copilot
Plug 'github/copilot.vim'
let g:copilot_filetypes = {
    \ 'markdown': v:false,
    \ 'rst': v:false,
    \ 'zsh': v:false,
    \ 'bash': v:false,
    \ 'fish': v:false,
    \ 'json': v:false,
    \ }

" Python syntax improvements
Plug 'vim-python/python-syntax'

" Rainbow parentheses
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

" Quickfix enhancements
Plug 'yssl/QFEnter'
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']

" Coc.nvim (the main LSP plugin)
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

" Wilder for better command-line completion
if has('nvim')
  Plug 'gelguy/wilder.nvim', { 'do': { -> UpdateRemotePlugins() } }
  " Nvim requires remote plugins update
  function! UpdateRemotePlugins()
    let &rtp=&rtp  " refresh runtime
    UpdateRemotePlugins
  endfunction
else
  Plug 'gelguy/wilder.nvim'
  " For Python remote features in Vim 8:
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Conditional Plugins Based on Executables
call PlugIfCommand('ag',      'rking/ag.vim')
call PlugIfCommand('pipenv',  'cespare/vim-toml')
call PlugIfCommand('docker',  'ekalinin/Dockerfile.vim')
call PlugIfCommand('git',     'tpope/vim-fugitive')
call PlugIfCommand('git',     'iberianpig/tig-explorer.vim')
call PlugIfCommand('psql',    'lifepillar/pgsql.vim')
call PlugIfCommand('node',    'leafgarland/typescript-vim')
call PlugIfCommand('node',    'HerringtonDarkholme/yats.vim')
call PlugIfCommand('node',    'posva/vim-vue')
call PlugIfCommand('node',    'jxnblk/vim-mdx-js')
call PlugIfCommand('node',    'neoclide/vim-jsx-improve')
call PlugIfCommand('node',    'jonsmithers/vim-html-template-literals')
call PlugIfCommand('tmux',    'wellle/tmux-complete.vim')
call PlugIfCommand('cargo',   'rust-lang/rust.vim')
call PlugIfCommand('terraform','hashivim/vim-terraform')
call PlugIfCommand('mix',     'elixir-editors/vim-elixir')

" End of plugin block
call plug#end()

"------------------------------------------------------------------------------
" BufRead / BufNewFile Autocommands for certain filetypes
"------------------------------------------------------------------------------
if executable('pipenv')
  augroup MyPipenvFiles
    autocmd!
    autocmd BufNewFile,BufRead Pipfile       setf toml
    autocmd BufNewFile,BufRead Pipfile.lock  setf json
  augroup END
endif

" Quick JSONC style for coc-settings or some other JSON with comments
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType scss setlocal iskeyword+=@-@

" Additional root patterns for certain filetypes
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'pyproject.toml', 'Pipfile']
autocmd FileType javascript,typescript,typescript.tsx let b:coc_root_patterns = ['.git', 'package-lock.json', 'yarn.lock']

" If we have bibtex-tidy installed, auto-clean .bib files
if executable('bibtex-tidy')
  autocmd BufWritePost *.bib silent! !bibtex-tidy % --quiet --no-backup
endif

"------------------------------------------------------------------------------
" General Settings for CoC, signcolumn, etc.
"------------------------------------------------------------------------------

" CoC global extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  "\ 'coc-html',
  "\ 'coc-css',
  \ 'coc-pyright',
  \ 'coc-tsserver',
  \ 'coc-rust-analyzer',
  "\ 'coc-vetur',
  "\ 2023-08-23 - prettier 3.x breaks https://github.com/neoclide/coc-prettier/pull/165
  \ 'coc-prettier',
  "\ 'coc-pairs',
  "\ 'coc-go',
  \ 'coc-yaml',
  \ 'coc-toml',
  \ 'coc-git',
  \ 'coc-lists',
  "\ 'coc-java'
  \ ]

" Faster updates (for lint / diagnostics)
set updatetime=300

" Don't show messages in completion popups
set shortmess+=c

" Show signcolumn so text doesn't shift
if has('nvim-0.5.0') || has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
endif

"------------------------------------------------------------------------------
" OnLoadCoc Function
"------------------------------------------------------------------------------
function! OnLoadCoc() abort
  " If coc.nvim isn't properly loaded, bail out
  if !exists('*CocActionAsync') || !exists('*CocAction')
    echo "coc.nvim not initialized, skipping CoC config"
    return
  endif

  " <Tab> to navigate completions
  function! s:CheckBackspace() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB>
        \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <CR> 
        \ coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Goto / references
  nmap <F12>    <Plug>(coc-definition)
  nmap <C-F12>  <Plug>(coc-type-definition)
  nmap <silent> gd   <Plug>(coc-definition)
  nmap <silent> <leader>g <Plug>(coc-definition)
  nmap <silent> <C-t> <Plug>(coc-definition)
  nmap <silent> gy   <Plug>(coc-type-definition)
  nmap <silent> <leader>G <Plug>(coc-type-definition)
  nmap <silent> gi   <Plug>(coc-implementation)
  nmap <silent> gr   <Plug>(coc-references)

  " Highlight references on CursorHold
  autocmd CursorHold * silent! call CocActionAsync('highlight')

  " Show documentation with K
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation() abort
    if index(['vim','help'], &filetype) >= 0
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  augroup MyCoCFormat
    autocmd!
    autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup END
endfunction

" Trigger the above function once CoC is loaded
call plugin_loader#PlugOnLoad('coc.nvim', 'call OnLoadCoc()')

"------------------------------------------------------------------------------
" Wilder (better command-line UI)
"------------------------------------------------------------------------------
function! OnLoadWilder() abort
  if exists('*IsPlugInstalled') && IsPlugInstalled('wilder.nvim')
    autocmd CmdlineEnter * ++once call s:wilder_init() | call g:wilder#main#start()
    function! s:wilder_init() abort
      call wilder#setup({'modes': [':', '/', '?']})
      call wilder#set_option('use_python_remote_plugin', 0)
    endfunction
  endif
endfunction

call plugin_loader#PlugOnLoad('wilder.nvim', 'call OnLoadWilder()')

"------------------------------------------------------------------------------
" Optional: source any additional plugin definitions for Neovim
"------------------------------------------------------------------------------
if has('nvim') && exists('*lib#SourceIfExists')
  call lib#SourceIfExists('~/.vim/plugins_nvim.vim')
endif
