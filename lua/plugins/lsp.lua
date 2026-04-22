return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason.nvim', cmd = 'Mason', build = ':MasonUpdate' },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            { 'folke/neodev.nvim', opts = {} },
        },
        config = function()
            -- Setup diagnostic configuration
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
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

            -- Setup LSP handlers
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

            -- LSP attach function
            local on_attach = function(client, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                end

                -- LSP keymaps
                map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('K', vim.lsp.buf.hover, 'Hover Documentation')

                -- Document highlighting
                if client.server_capabilities.document_highlight then
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

            -- Setup Mason
            require('mason').setup()
            
            local servers = {
                clangd = {
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
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    "${3rd}/luv/library",
                                    unpack(vim.api.nvim_get_runtime_file("", true)),
                                },
                            },
                            completion = { callSnippet = "Replace" },
                            diagnostics = { disable = { "missing-fields" } },
                        },
                    },
                },
                zls = {},
            }

            -- Setup mason-lspconfig
            require('mason-lspconfig').setup {
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, 
                            vim.lsp.protocol.make_client_capabilities(), server.capabilities or {})
                        server.on_attach = on_attach
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
