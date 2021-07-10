set autoindent
set hidden
set ignorecase
set number

let mapleader=','
set expandtab 
set softtabstop=4
set shiftwidth=4
set autoindent
set pyxversion=3

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

