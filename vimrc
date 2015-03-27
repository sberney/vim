" Universe Fragment .vimrc {{{
" iffothen/sol
" For beautious terminal shells, remember to set 256 colors in the your .profile
" But that's awful, because there is no background image.
" In 256 color, lodestone is all right, molokai is great, and zenburn is zenburn
"
" 1) much from https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
" 2) a list of interesting vim plugins can be found at
"    http://el-tramo.be/blog/my-favorite-vim-plugins/ }}}

set nocompatible    " devient viMprovée

" In the beginning the Universe was created. This has made a lot
" of people very angry and been widely regarded as a bad move. {

        let $SUPERHOME      = $HOME . '/.vim'

        let g:tab_spacing   = 4
        set expandtab       " replace tab with spaces !!
        set wrap
" }

" Thusly pathed {
        set rtp+=$SUPERHOME/bundle/vundle/      " vundling hausaufgaben

        let g:ctrlp_default_input = 'gitc/'     " ctrlp search root !!
        let g:ctrlp_cache_dir = $SUPERHOME.'/.cache/ctrlp'

        if has("persistent_undo") " persistent undo since 7.3
                set undodir=$SUPERHOME/undodir
                set undofile
        endif

        " see $SUPERHOME/cddir.vim for more paths
" }

" Sourcing vimscript & co {{{
        " Reload changes to .vimrc automatically
        augroup vimsourcer
                autocmd!
                "autocmd BufWritePost ~/_vimrc source ~/_vimrc
                autocmd BufWritePost $SUPERHOME/vimrc source $SUPERHOME/vimrc
                autocmd BufWritePost $SUPERHOME/*.vim source $SUPERHOME/vimrc
        augroup END

        " Our birth is but a sleep and a forgetting. {
                source $SUPERHOME/core.vim
                source $SUPERHOME/statusline.vim
                source $SUPERHOME/cddir.vim
                source $SUPERHOME/python_vim_fxns.vim
        " }
" }}}

" Tips, not settings. {{{
        " Note: there should be $HOME, $MYVIMRC environment variables pre-set.
        " There should not be any other $SUPERHOME set.

        " where was an option set
        " :scriptnames : list all plugins, _vimrcs loaded (super)
        " :verbose set history? : reveals value of history and where set
        " :function : list functions
        " :func SearchCompl : List particular function
" }}}
