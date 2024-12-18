-- exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

 require('options').set_options( {
    autoindent = true,
    backup = false,
    breakindent = true,
    clipboard = 'unnamedplus',
    completeopt='menu,menuone,noselect',
    expandtab = true,
    hidden = true,
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    mouse = 'a',
    number = true ,
    pyxversion = 3,
    shiftwidth = 4,
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    swapfile = false,
    termguicolors = true,
    undofile = true,
    updatetime = 250,
    list = true,
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    inccommand = 'split',
    cursorline = true,
})


require('keymaps').normal({
    { "<C-n>", ":Startify<CR>" },
    {'<F1>', '<Nop>'},
    {'<C-h>', '<C-w><C-h>', {desc = 'Move focus to the left window'}},
    {'<C-l>', '<C-w><C-l>', {desc = 'Move focus to the right window'}},
    {'<C-j>', '<C-w><C-j>', {desc = 'Move focus to the lower window'}},
    {'<C-k>', '<C-w><C-k>', {desc = 'Move focus to the upperr window'}},
    { '<Esc>', '<cmd>nohlsearch<CR>', {desc = 'Clear search highlight'}},
})

-- TODO: how to add these above
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set('i', '<F1>', '<ESC>')


require('plugins').use( {
    -- simple plugins with default config
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'vimwiki/vimwiki',
    'mbbill/undotree',
    'nvim-lualine/lualine.nvim',
    'justinmk/vim-dirvish',
    'voldikss/vim-floaterm',
    'tpope/vim-fugitive',
    'tpope/vim-eunuch',
    'lewis6991/gitsigns.nvim',
    'mhinz/vim-startify',
    -- Color themes
    'morhetz/gruvbox',
    'mhartington/oceanic-next',
    'sickill/vim-monokai',
    'joshdick/onedark.vim',

    -- plugins with configurtion are in their own files
    require 'plugins.which-key',
    require 'plugins.nvim-comment',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.lsp',
    require 'plugins.nvim-cmp',
    require 'plugins.conform',
})

-- TODO: where to put this?
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Hight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

