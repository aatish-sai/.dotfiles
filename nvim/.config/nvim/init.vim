call plug#begin('~/.vim/plugged')
" color scheme
Plug 'gruvbox-community/gruvbox'

" cmp plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" comment

" web icon
Plug 'kyazdani42/nvim-web-devicons'

" nvim tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

lua require("aatish")

let mapleader = " "

" reload vim files
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

colorscheme gruvbox
highlight Normal guibg=None
