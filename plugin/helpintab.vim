" Show help files in a new tab
let g:help_in_tabs = 1
" toggle it on/off
nmap <silent> H :let g:help_in_tabs = !g:help_in_tabs<CR>


" Only apply to .txt files
augroup HelpInTabs
	autocmd!

	autocmd BufEnter *.txt call helpintab#helpInNewTab ()
augroup END


