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
        " Color themes
	call minpac#add('morhetz/gruvbox')
	call minpac#add('mhartington/oceanic-next')
	call minpac#add('arcticicestudio/nord-vim')
	call minpac#add('sickill/vim-monokai')
endfunction
