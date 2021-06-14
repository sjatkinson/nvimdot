command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minipac#clean()
command! PackStatus packadd minipac | call minpac#status()
