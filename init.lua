-- exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('plugins').use(
    {
        'junegunn/fzf',
        'junegunn/fzf.vim',
        'vimwiki/vimwiki',
        'mbbill/undotree',
        'nvim-lualine/lualine.nvim',
        'justinmk/vim-dirvish',
        'voldikss/vim-floaterm',
        'tpope/vim-fugitive',

        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }},
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = vim.fn.executable 'make' == 1 },

        -- treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        },

        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            dependencies = {'nvim-treesitter'},
        },

        {
            'neovim/nvim-lspconfig',
            dependencies = {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'j-hui/fidget.nvim',
            },
        },
        -- completion
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
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
        { "folke/neodev.nvim", opts = {} }
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
    updatetime = 250,
    completeopt=menu,menuone,noselect,
})

opts.set_vim_options({ "colorscheme onedark"})
vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('i', '<F1>', '<ESC>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.opt.listchars = {
}

