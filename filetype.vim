if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.tooltest   setf ruby
augroup END
