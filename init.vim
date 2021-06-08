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

syntax on
syntax enable
filetype plugin indent on


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


"=== Packages

function! PackInit()
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type' : 'opt' })
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('vimwiki/vimwiki')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('morhetz/gruvbox')
	call minpac#add('mhartington/oceanic-next')
	call minpac#add('arcticicestudio/nord-vim')
	call minpac#add('sickill/vim-monokai')
	call minpac#add('neoclide/coc.nvim', { 'branch' : 'release'})
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minipac#clean()
command! PackStatus packadd minipac | call minpac#status()

nmap <C-F> :Files .<CR>
nmap <leader>e :Files %:p:h<CR>

