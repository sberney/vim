" Universe Fragment's .vimrc { 
" iffothen/sol
" For beautious terminal shells, remember to set 256 colors in the your .profile
" But that's awful, because there is no background image.
" In 256 color, lodestone is all right, molokai is great, and zenburn is zenburn
"
" 1) much from https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
" 2) a list of interesting vim plugins can be found at
"    http://el-tramo.be/blog/my-favorite-vim-plugins/

set nocompatible
filetype off    " required, apparently
filetype plugin indent on

" Vundle {
        " Configuration {
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Vundle manages vundle
        Bundle 'gmarik/vundle'

        " Plugin package management (Vundle) {
            " Fly through vim with visual ease
            Bundle 'Lokaltog/vim-easymotion'
            " Lua syntax highlighting.
            Bundle 'xolox/vim-misc'
            Bundle 'xolox/vim-lua-inspect'
            " Syntax checker (on close) for many languages
            Bundle 'scrooloose/syntastic'
            " Disctraction-free writing env: :Goyo [width]
            Bundle 'junegunn/goyo.vim'
            " Open files below node with fuzzy search
            Bundle 'kien/ctrlp.vim'
            " File explorer
            Bundle 'scrooloose/nerdtree'
            " Graphical undo tree explorer
            Bundle 'sjl/gundo.vim'
            " easy to define substitution rules via subversion and coercion
            Bundle 'tpope/vim-abolish'
            " Python ide
            Bundle 'klen/python-mode'


        " Theme management (Vundle) {
            Bundle 'tomasr/molokai'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'marcus/vim-mustang'
            Bundle 'jnurmine/Zenburn'


" Reload changes to .vimrc automatically
autocmd BufWritePost ~/.vimrc source ~/.vimrc


" Visuals {
        "set t_Co=256   " Necessary for many colorschemes.
        "set background=dark
        "let g:zenburn_high_Contrast = 1 " For bright rooms.
        "unlet g:zenburn_high_Contrast  " For dark rooms.
        "colorscheme zenburn

        "set number
        set relativenumber

        set more        " more is less
        set cursorline! " why the !?
        syntax on       " syntax highlighting

        set hlsearch
        set incsearch

        " mark anything over 80 characters red:
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        nmap mm :match OverLength /\%>80v.\+/
        nmap mn :match None


        set showmatch   " highlights matching brackets when selected
        set matchtime=2 " How many tenths of a second to blink when matching brackets

        set wildmode=list:longest
        set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
        " set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
        " set wildignore+=*vim/backups*
        " set wildignore+=*sass-cache*
        " set wildignore+=*DS_Store*
        " set wildignore+=vendor/rails/**
        " set wildignore+=vendor/cache/**
        " set wildignore+=*.gem
        " set wildignore+=log/**
        " set wildignore+=tmp/**
        " set wildignore+=*.png,*.jpg,*.gif
        " set wildignore+=*node_modules*

        " Visualize tabs, trailing whitespaces and funny characters
        " http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
        " https://wincent.com/blog/making-vim-highlight-suspicious-characters
        set list
        set listchars=nbsp:¬,tab:»·,trail:·

" Function {
        set magic       " regex
        set smarttab
        set expandtab
        set softtabstop=4
        set tabstop=8   " width of an actual \t
        "set backspace=indent,eol,start

        set ttyfast     " if using vim in the normal way, this makes drawing faster
        set splitright  " otherwise vsplit opens up on the left side

        set noerrorbells
        set novisualbell

        set scrolloff=8 "Start scrolling when we're 8 lines away from margins
        set sidescrolloff=15
        set sidescroll=1

        " Starting from vim 7.3 undo can be persisted across sessions
        " http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
        if has("persistent_undo")
            set undodir=~/.vim/undodir
            set undofile
        endif

        " Return to last edit position when opening files (You want this!)
        autocmd BufReadPost *
             \ if line("'\"") > 0 && line("'\"") <= line("$") |
             \ exe "normal! g`\"" |
             \ endif
        " Remember info about open buffers on close
        set viminfo^=%

" Key mapping {
        let mapleader = ',' " alt: '\'

        " Save and run current file
        map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>
        nnoremap <F4>   :GundoToggle<CR>

        let g:ctrlp_map = '<c-p>'
        nmap <silent> <C-D> :NERDTreeToggle<CR>
        nmap <Space>    <C-F>

        cmap w!! %!sudo tee > /dev/null %
                " Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
                " vim file (it will prompt for sudo password when writing)
                " http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492

        " I'm tired of searching for glkjgkl to clear my search
        nmap <silent> ,/ :nohlsearch<CR>

        " to make it easier to type vim commands
        nnoremap ; :

        " ; {
        "        nnoremap ;; <Esc>
        "        vnoremap ;; <Esc>
        "        onoremap ;; <Esc>
        "        inoremap ;; <Esc>
                " The previous screws up the default ; command:
        "        nnoremap ,; ;

        " Make arrow keys useful again {
                map <down> <ESC>:bn<RETURN>
                map <left> <ESC>:NERDTreeToggle<RETURN>
                map <right> <ESC>:Tlist<RETURN>
                map <up> <ESC>:bp<RETURN>


" Directory shortcuts {
        let sd = $HOME."\\Documents\\syncdoc"
        map <leader>sd :exec "cd ".sd<RETURN>
        map <leader>cd :cd %:p:h<RETURN>



" Stuff I might one day find interesting {
        " hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
        " hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
        " hi User3 guifg=#ff66ff guibg=#222222
        " hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
        " hi User5 guifg=#eeee40 guibg=#222222
        "
        " " Statusline
        " " https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
        " set statusline= " Override default
        " set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git
        " info
        " set statusline+=%2*\ %f\ %m\ %r%* " Show filename/path
        " set statusline+=%3*%=%* " Set right-side status info after this line
        " set statusline+=%4*%l/%L:%v%* " Set <line number>/<total lines>:<column>
        " set statusline+=%5*\ %* " Set ending space
        "
        " " Set 7 lines to the cursor - when moving vertically using j/k
        " set scrolloff=7


" Tips, not settings. {
        " where was an option set
        " :scriptnames : list all plugins, _vimrcs loaded (super)
        " :verbose set history? : reveals value of history and where set
        " :function : list functions
        " :func SearchCompl : List particular function

