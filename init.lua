
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
    termguicolors = true,
    completeopt=menu,menuone,noselect,
})

opts.set_globals({ mapleader = "," })
opts.set_vim_options({ "colorscheme gruvbox"})

local plugins = require('plugins')

plugins.init()

plugins.use({
         'junegunn/fzf',
         'junegunn/fzf.vim',
         'vimwiki/vimwiki',
         'justinmk/vim-dirvish',
         'voldikss/vim-floaterm',


	 'neovim/nvim-lspconfig',
         -- completion
         'hrsh7th/nvim-cmp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-cmdline',
         'saadparwaiz1/cmp-luasnip',

         -- snippets
         'L3MON4D3/LuaSnip', -- snippet engine
         'rafamadriz/friendly-snippets',

         'mhinz/vim-startify',
         'tpope/vim-eunuch',
         {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        },
        -- Color themes
         'morhetz/gruvbox',
         'mhartington/oceanic-next',
         'arcticicestudio/nord-vim',
         'sickill/vim-monokai'
     })

vim.api.nvim_exec([[

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
autocmd BufNewFile,BufRead *.cpp,*.h,*.py setlocal list

]], false)


-- TODO - make a mappings lua module
-- mappings
vim.api.nvim_set_keymap("n", "<C-f>", ":Files<CR>",{} )
vim.api.nvim_set_keymap("n", "<C-n>", ":Startify<CR>", {})

