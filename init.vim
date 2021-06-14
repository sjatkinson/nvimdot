set number
set hidden
set ignorecase
set expandtab 
set softtabstop=4
set shiftwidth=4
set autoindent
set pyxversion=3

let mapleader = ","

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
autocmd BufNewFile,BufRead *.cpp,*.h,*.py setlocal list

syntax on
syntax enable


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

" mappings
map <C-f> :Files<CR>


" Only apply to .txt files
augroup HelpInTabs
	autocmd!

	autocmd BufEnter *.txt call HelpInNewTab()
augroup END

if (has("termguicolors"))
 set termguicolors
endif
colorscheme gruvbox


"=== Load plugins I use
source $HOME/.config/nvim/plugins/plugins.vim

"=== Load plugin configurations
source $HOME/.config/nvim/plugins/minpac.vim
source $HOME/.config/nvim/plugins/startify.vim
source $HOME/.config/nvim/plugins/floaterm.vim

