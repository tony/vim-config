" Only included if exists + has('neovim')

" avante.nvim
" https://github.com/yetone/avante.nvim/blob/6b41c64/README.md

" Deps
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

" Optional deps
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

" Yay
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': ':AvanteBuild', 'on': 'AvanteAsk' }
