
local opts = require('options')
opts.set_options( { 
    autoindent = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    number = true ,
    pyxversion = 3,
    shiftwidth = 4,
    softtabstop = 4,
    smartindent = true,
    swapfile = false,
    backup = false,
    termguicolors = true,
    hlsearch = false,
    incsearch = true,
    completeopt=menu,menuone,noselect,
})

opts.set_globals({ mapleader = " " })
opts.set_vim_options({ "colorscheme gruvbox"})

vim.opt.listchars = {
}

-- exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

require('plugins').use({
         'junegunn/fzf',
         'junegunn/fzf.vim',
         'vimwiki/vimwiki',
         'justinmk/vim-dirvish',
         'voldikss/vim-floaterm',
         'tpope/vim-fugitive',

         { 'nvim-telescope/telescope.nvim',
           branch = '0.1.x', 
           requires = { 'nvim-lua/plenary.nvim' }},
         { 'nvim-telescope/telescope-fzf-native.nvim',
           run = 'make', 
           cond = vim.fn.executable 'make' == 1 },


	 'neovim/nvim-lspconfig',
         -- completion
         'hrsh7th/nvim-cmp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-cmdline',
         -- 'saadparwaiz1/cmp_luasnip',

         -- snippets
         'L3MON4D3/LuaSnip', -- snippet engine
         'rafamadriz/friendly-snippets',

	 'lewis6991/gitsigns.nvim',
         'mhinz/vim-startify',
         'tpope/vim-eunuch',

        -- Color themes
         'morhetz/gruvbox',
         'mhartington/oceanic-next',
         'arcticicestudio/nord-vim',
         'sickill/vim-monokai'
     })


local keymaps = require('keymaps')
keymaps.normal( {
	{ "<C-n>", ":Startify<CR>" },
})


