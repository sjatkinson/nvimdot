"
" Plugins
"
packadd minpac

call minpac#init()

call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('vimwiki/vimwiki')
call minpac#add('morhetz/gruvbox')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"
" Settings
"

set hidden
set number
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent

syntax on
syntax enable
filetype plugin indent on

let mapleader=','

"
" Functions
"
function! CurDir()
    " returns the cwd with '~' in place of $HOME if we're in our home tree
    let curdir = subsitute(getcwd(), $HOME, "~", "")
endfunction

"
" Status line
"
set laststatus=2
set statusline=%F                       " full file path
set statusline+=\ \ \ [%{&fileformat}]
set statusline+=\ \ \ %y                    " file type
set statusline+=\ %m                    " modified?
set statusline+=\ %r                    " read-only?
set statusline+=%=
set statusline+=\ (%l\/%L)
set statusline+=\ %c(%B)


"
" Mappings
"

nnoremap <silent> <c-f> :Files<CR>


cnoremap %% <C-R>=expand('%:h).'/'<cr>
map <leader>e :edit %%
