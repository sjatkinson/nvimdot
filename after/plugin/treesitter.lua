-- nvim-treesitter v1.0 (main branch) API.
-- markdown/markdown_inline intentionally omitted: Nvim 0.12 bundles both,
-- and co-installing via the plugin re-creates the rtp collision that led
-- to the overrides under ~/.config/nvim/queries/markdown*/.
-- textobjects keymaps from the old master config are in git history
-- (see pre-migration after/plugin/treesitter.lua); re-add via
-- nvim-treesitter-textobjects main branch setup in a follow-up.

require('nvim-treesitter').setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install({
    'c', 'cpp', 'go', 'lua', 'python', 'ruby', 'rust', 'zig',
    'bash', 'vim', 'vimdoc', 'diff', 'gitcommit',
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.start, args.buf, lang) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
