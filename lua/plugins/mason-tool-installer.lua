return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'tree-sitter-cli',
                    -- formatters (see lua/plugins/conform.lua)
                    'goimports',
                    'stylua',
                    'shfmt',
                    'ruff',
                    'clang-format',
                },
                auto_update = false,
                run_on_start = true,
            })
        end,
    },
}
