-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
-- https://github.com/p00f/clangd_extensions.nvim
local M = {}

local lsp_handlers = require("lsp.lsp_handlers")
local diagnostics = require("lsp.diagnostics")

M.setup = function()
    vim.lsp.config('clangd', {
        on_attach = function(client, bufnr)
            lsp_handlers.set_autocmds(client, bufnr)
            lsp_handlers.set_additional_plugins(client, bufnr)
            diagnostics.set_mappings(client, bufnr)
        end,
        capabilities = lsp_handlers.capabilities,
        root_dir = function(fname)
            return vim.fs.root(fname, { 'compile_commands.json' })
        end,
        single_file_support = false,
    })
    vim.lsp.enable('clangd')
end

return M
