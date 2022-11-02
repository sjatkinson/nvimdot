let g:startify_bookmarks = [
  \ { 'z': '~/.config/zsh/zshrc' },
  \ { 'v': '~/.config/nvim/init.lua' },
  \ { 'r': '~/devel/TpsBridge/'}
  \ ]

let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
      \ ]

