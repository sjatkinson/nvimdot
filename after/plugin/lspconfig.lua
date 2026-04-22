local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eference')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplentation')
    nmap('<leader>D', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')



    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
end

require('mason').setup()

-- ruby_lsp deferred: needs Ruby >= 2.7; macOS ships 2.6. Rare work-use
-- doesn't justify installing brew ruby or a version manager. Re-enable
-- when actually needed.
local servers = { 'clangd', 'lua_ls', 'zls', 'gopls', 'basedpyright', 'ruff', 'bashls' }

require('mason-lspconfig').setup {
    ensure_installed = servers
}



require('fidget').setup()

vim.lsp.config('*', {
    on_attach = on_attach,
})

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/*.lua')
table.insert(runtime_path, 'lua/**/init.lua')

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})

require('lsp.clangd').setup()

vim.lsp.enable({ 'lua_ls', 'zls', 'gopls', 'basedpyright', 'ruff', 'bashls' })
