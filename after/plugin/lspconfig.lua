local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    if client and client.server_capabilities.document_highlight then
        local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

require('mason').setup()

-- ruby_lsp deferred: needs Ruby >= 2.7; macOS ships 2.6. Rare work-use
-- doesn't justify installing brew ruby or a version manager. Re-enable when actually needed.
local servers = { 'clangd', 'lua_ls', 'zls', 'gopls', 'basedpyright', 'ruff', 'bashls' }

require('mason-lspconfig').setup {
    ensure_installed = servers
}

require('fidget').setup()

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
}
for _, s in ipairs(signs) do
    vim.fn.sign_define(s.name, { texthl = s.name, text = s.text, numhl = "" })
end

vim.diagnostic.config({
    update_in_insert = false,
    underline = true,
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
        source = true,
        spacing = 10,
    },
    signs = { active = signs },
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.o.winborder = "rounded"

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

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    },
    root_dir = function(fname)
        return vim.fs.root(fname, { 'compile_commands.json' })
    end,
    single_file_support = false,
})

vim.lsp.enable({ 'lua_ls', 'zls', 'gopls', 'basedpyright', 'ruff', 'bashls', 'clangd' })
