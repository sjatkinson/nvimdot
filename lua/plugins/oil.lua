return {
    {
        'stevearc/oil.nvim',
        cmd = 'Oil',
        keys = {
            { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
        },
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = false,
                natural_order = true,
            },
            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
            },
            keymaps = {
                ['<C-c>'] = false,
                ['q'] = 'actions.close',
            },
        },
    },
}
