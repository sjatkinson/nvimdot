-- exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

require('plugins').use(
    {
        'junegunn/fzf',
        'junegunn/fzf.vim',
        'vimwiki/vimwiki',
        'mbbill/undotree',
        'justinmk/vim-dirvish',
        'voldikss/vim-floaterm',
        'tpope/vim-fugitive',

        { 
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x', 
            requires = { 'nvim-lua/plenary.nvim' }},
        { 
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make', 
            cond = vim.fn.executable 'make' == 1 },

        -- treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        },

        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        },

        {
            'neovim/nvim-lspconfig',
            requires = {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'j-hui/fidget.nvim',
            },
        },
        -- completion
        {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'saadparwaiz1/cmp_luasnip',
                'L3MON4D3/LuaSnip', -- snippet engine
                'rafamadriz/friendly-snippets',
            },
        },

        'lewis6991/gitsigns.nvim',
        'mhinz/vim-startify',
        'tpope/vim-eunuch',

        -- Color themes
        'morhetz/gruvbox',
        'mhartington/oceanic-next',
        'sickill/vim-monokai',
        'joshdick/onedark.vim',
    })


local keymaps = require('keymaps')
keymaps.normal( {
    { "<C-n>", ":Startify<CR>" },
})


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
opts.set_vim_options({ "colorscheme onedark"})

vim.opt.listchars = {
}

