set number
set hidden
set ignorecase

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


" Only apply to .txt files
augroup HelpInTabs
	autocmd!

	autocmd BufEnter *.txt call HelpInNewTab()
augroup END


"=== help in tabs end

function! PackInit()
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type' : 'opt' })
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')

endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minipac#clean()
command! PackStatus packadd minipac | call minpac#status()
