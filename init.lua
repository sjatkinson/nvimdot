
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


-- TODO: put plugin setup in it's own lua. Just pass in array of plugins
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]
local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'vimwiki/vimwiki'
  use 'justinmk/vim-dirvish'
  use 'voldikss/vim-floaterm'
  use {
      'neoclide/coc.nvim', 
      branch = 'release'}
  use 'mhinz/vim-startify'
  use 'tpope/vim-eunuch'
  -- Color themes
  use 'morhetz/gruvbox'
  use 'mhartington/oceanic-next'
  use 'arcticicestudio/nord-vim'
  use 'sickill/vim-monokai'
end)


vim.api.nvim_exec([[


exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
autocmd BufNewFile,BufRead *.cpp,*.h,*.py setlocal list


" TODO: put this help in tabs in my own plugin
" Show help files in a new tab
let g:help_in_tabs = 1
" toggle it on/off
nmap <silent> H :let g:help_in_tabs = !g:help_in_tabs<CR>

function! HelpInNewTab()
	if &buftype == 'help' && g:help_in_tabs
		" convert the help window to a tab
		execute "normal \<C-W>T"
	endif
endfunction

" Only apply to .txt files
augroup HelpInTabs
	autocmd!

	autocmd BufEnter *.txt call HelpInNewTab()
augroup END



"=== Load plugin configurations
source $HOME/.config/nvim/plugins-config/startify.vim
source $HOME/.config/nvim/plugins-config/floaterm.vim
source $HOME/.config/nvim/plugins-config/vimwiki.vim

]], false)


-- mappings
vim.api.nvim_set_keymap("n", "<C-f>", ":Files<CR>",{} )
vim.api.nvim_set_keymap("n", "<C-n>", ":Startify<CR>", {})

