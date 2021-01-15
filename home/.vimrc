au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead scp://* :set bt=acwrite
set mouse=r
set backupdir-=.
set backupdir^=~/tmp,/tmp
set noundofile
set number
hi LineNr term=NONE ctermfg=green ctermbg=black
set statusline+='%F'
syntax on
set nosmartindent
set cindent
filetype plugin indent on
set cinkeys-=0#
set indentkeys-=0#
autocmd FileType * set cindent "some file types override it

