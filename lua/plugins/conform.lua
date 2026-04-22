return {
    {
        'stevearc/conform.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    cpp    = { "clang-format" },
                    go     = { "goimports" },
                    python = { "ruff_format", "ruff_fix" },
                    sh     = { "shfmt" },
                    lua    = { "stylua" },
                    -- zig formats via LSP (zls) through lsp_fallback below.
                    -- ruby deferred alongside ruby_lsp.
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                },
            })
        end,
    },
}

