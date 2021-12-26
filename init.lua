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

vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.pyxversion = 3

vim.api.nvim_exec([[

let mapleader = ","

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
autocmd BufNewFile,BufRead *.cpp,*.h,*.py setlocal list


filetype plugin indent on
syntax on
syntax enable


" TODO: where to put this
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

if (has("termguicolors"))
 set termguicolors
endif
colorscheme gruvbox


"=== Add plugins I use
function! PackInit()
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type' : 'opt' })
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('vimwiki/vimwiki')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('voldikss/vim-floaterm')
	call minpac#add('neoclide/coc.nvim', { 'branch' : 'release'})
	call minpac#add('mhinz/vim-startify')
	call minpac#add('tpope/vim-eunuch')
        " Color themes
	call minpac#add('morhetz/gruvbox')
	call minpac#add('mhartington/oceanic-next')
	call minpac#add('arcticicestudio/nord-vim')
	call minpac#add('sickill/vim-monokai')
endfunction

"=== Load plugin configurations
source $HOME/.config/nvim/plugins-config/minpac.vim
source $HOME/.config/nvim/plugins-config/startify.vim
source $HOME/.config/nvim/plugins-config/floaterm.vim
source $HOME/.config/nvim/plugins-config/vimwiki.vim


"=== mappings
map <C-f> :Files<CR>
nmap <c-n> :Startify<cr>
]], false)
