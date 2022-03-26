
local opts = require('options')
opts.set_options( { 
    autoindent = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    number = true ,
    pyxversion = 3,
    shiftwidth = 4,
    softtabstop = 4,
    termguicolors = true
})

opts.set_globals({ mapleader = "," })
opts.set_vim_options({ "colorscheme gruvbox"})

require('plugins').init({
         'junegunn/fzf',
         'junegunn/fzf.vim',
         'vimwiki/vimwiki',
         'justinmk/vim-dirvish',
         'voldikss/vim-floaterm',
         { 'neoclide/coc.nvim', branch = 'release'},
         'mhinz/vim-startify',
         'tpope/vim-eunuch',
         {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        },
        -- Color themes
         'morhetz/gruvbox',
         'mhartington/oceanic-next',
         'arcticicestudio/nord-vim',
         'sickill/vim-monokai'
     })

vim.api.nvim_exec([[

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
autocmd BufNewFile,BufRead *.cpp,*.h,*.py setlocal list

]], false)


-- TODO - make a mappings lua module
-- mappings
vim.api.nvim_set_keymap("n", "<C-f>", ":Files<CR>",{} )
vim.api.nvim_set_keymap("n", "<C-n>", ":Startify<CR>", {})

