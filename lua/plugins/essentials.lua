-- Essential utility plugins with minimal configuration
return {
    -- Git integration
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    
    -- Undo tree visualization
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle undotree' },
        },
    },
    
    -- Git wrapper
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse', 'GRemove', 'GRename', 'Glgrep', 'Gedit' },
        ft = { 'fugitive' },
    },
    
    -- Unix helpers
    {
        'tpope/vim-eunuch',
        cmd = { 'Remove', 'Delete', 'Move', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind', 'Wall', 'SudoWrite', 'SudoEdit' },
    },
    
    -- Terminal
    {
        'voldikss/vim-floaterm',
        keys = {
            { '<C-n>', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal' },
            { '<C-n>', '<C-\\><C-n>:FloatermToggle<cr>', mode = 't', desc = 'Toggle terminal' },
        },
        cmd = { 'FloatermNew', 'FloatermToggle' },
        init = function()
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
        end,
    },
    
    -- Start screen
    {
        'mhinz/vim-startify',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.startify_change_to_dir = 0
        end,
    },
    
    -- Comment toggle
    {
        'numToStr/Comment.nvim',
        keys = {
            { 'gc', mode = { 'n', 'v' }, desc = 'Comment toggle linewise' },
            { 'gb', mode = { 'n', 'v' }, desc = 'Comment toggle blockwise' },
        },
        opts = {},
    },
    
    -- Color scheme
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
    },
}
