set number
set hidden
set ignorecase

syntax on
syntax enable

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
