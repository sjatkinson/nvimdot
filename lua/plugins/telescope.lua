return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        cmd = 'Telescope',
        keys = {
            { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = '[?] Recently opened files' },
            { '<leader><space>', '<cmd>Telescope buffers<cr>', desc = '[ ] Existing buffers' },
            { '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, desc = '[/] Fuzzily search in current buffer' },
            { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
            { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
            { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
            { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
            { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
            { '<leader>sr', '<cmd>Telescope git_files<cr>', desc = '[S]earch Git [R]epo' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
            }
            
            -- Load extensions
            pcall(require('telescope').load_extension, 'fzf')
        end,
    },
}
