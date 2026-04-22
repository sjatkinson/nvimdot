return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
        opts = {
            delay = 800,
            preset = 'modern',
            spec = {
                { '<leader>c', group = '[C]ode' },
                { '<leader>d', group = '[D]ocument' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>t', group = '[T]oggle' },
                { '<leader>w', group = '[W]orkspace' },
                { '<leader>f', group = '[F]ile' },
                { '<leader>g', group = '[G]it' },
            },
        },
    },
}
