" Universe Fragment .vimrc {{{
" iffothen/sol
" For beautious terminal shells, remember to set 256 colors in the your .profile
" But that's awful, because there is no background image.
" In 256 color, lodestone is all right, molokai is great, and zenburn is zenburn
"
" 1) much from https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
" 2) a list of interesting vim plugins can be found at
"    http://el-tramo.be/blog/my-favorite-vim-plugins/ }}}

set nocompatible
filetype off    " required, apparently
filetype plugin indent on

" Vundle {{{
        " Configuration {{{
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        " }}}

        " Vundle manages vundle {{{
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
            " awesome statusline!
            Plugin 'bling/vim-airline'
            " Display the buffer number along with the buffer name 
            Bundle 'bling/vim-bufferline'
            " Allows commandline from vim??
            Bundle 'edkolev/promptline.vim'

            " git {
                " show column with +/-/etc for git diff
                Plugin 'airblade/vim-gitgutter'
                " vim fugitive (git int)
                Plugin 'tpope/vim-fugitive'

            " ctags integration { 
                " alternate tagbar: more features
                Bundle 'majutsushi/tagbar'
                " Taglist: display current function, etc. -> arrow
                " this can be removed if tagbar is liked.
                Bundle 'vim-scripts/taglist.vim'

            " Python ide {
                Bundle 'klen/python-mode'
                " Hangs on period sometimes. Does this fix?
                let g:pymode_rope_lookup_project = 0
                let g:pymode_rope = 0
        " }}}


        " Theme management (Vundle) {{{
            Bundle 'tomasr/molokai'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'marcus/vim-mustang'
            Bundle 'jnurmine/Zenburn'
        " }}}
" }}}


" Sourcing vimscript & co {{{
        " Reload changes to .vimrc automatically
        augroup vimsourcer
                autocmd!
                autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
        augroup END
        
        " Import custom extensions {
                source ~/.vim/python_vim_fxns.vim
" }}}

" Markers {{{
        augroup filetype_vim
                autocmd!
                autocmd FileType vim setlocal foldmethod=marker
        augroup END
" }}}


" Visuals and Form {{{
        " Themes and color counts {{{
                "set t_Co=256   " Necessary for many colorschemes.
                "set background=dark
                "set background=light

                if has('gui_running')
                        colorscheme molokai
                endif

                " Solarized {
                        "colorscheme solarized
                        "set background=light

                if !has('gui_running')
                " Zenburn {
                        "set background=dark
                        "let g:zenburn_high_Contrast = 1 " For bright rooms.
                        "unlet g:zenburn_high_Contrast  " For dark rooms.
                        colorscheme zenburn
                endif
        " }}}

        set number
        "set relativenumber

        set laststatus=2

        set more        " more is less
        set cursorline! " 
        syntax on       " syntax highlighting

        set hlsearch
        set incsearch

        " mark anything over 80 characters red:
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        nnoremap mm :match OverLength /\%>80v.\+/<CR>
        nnoremap mn :match None<CR>


        set showmatch   " highlights matching brackets when selected
        set matchtime=2 " How many tenths of a second to blink when matching brackets

        if has('gui_running')
                call ToggleFoldcolumn()  " show FC by default (leader fc toggles)
        endif

        " wildmenu {{{
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
        " }}}

        " Visualize tabs, trailing whitespaces and funny characters {{{
                " http://www.reddit.com/r/programming/comments/9wlb7/ ...
                " ... proggitors_do_you_like_the_idea_of_indented/c0esam1
                " https://wincent.com/blog/making-vim-highlight-suspicious-characters

                set list
                set listchars=nbsp:¬,tab:»·,trail:·
        " }}}

        " Fullscreen settings {{{
                function! ToggleFullScreenSettings()
                        if &showtabline == 0
                                set showtabline=1   " tab bar
                                "set guioptions+=r  " scroll bars
                                "set guioptions+=L
                        else
                                set showtabline=0   " tab bar
                                "set guioptions-=r  " scroll bars
                                "set guioptions-=L
                        endif
                endfunction
        " }}}

        " Statusline {{{
                " Traditional Statusline {{{
                        " Tassos's {{{
                                "set statusline=
                                "set statusline +=%1*\ %n\ %*            "buffer number
                                "set statusline +=%5*%{&ff}%*            "file format
                                "set statusline +=%3*%y%*                "file type
                                "set statusline +=%4*\ %<%F%*            "full path
                                "set statusline +=%2*%m%*                "modified flag
                                "set statusline +=%1*%=%5l%*             "current line
                                "set statusline +=%2*/%L%*               "total lines
                                "set statusline +=%1*%4v\ %*             "virtual column number
                                "set statusline +=%2*0x%04B\ %*          "character under cursor
                                "hi User1 guifg=#eea040 guibg=#222222
                                "hi User2 guifg=#dd3333 guibg=#222222
                                "hi User3 guifg=#ff66ff guibg=#222222
                                "hi User4 guifg=#a0ee40 guibg=#222222
                                "hi User5 guifg=#eeee40 guibg=#222222
                        " }}}
                
                        " Remon's {{{
                                function! HighlightSearch()
                                  if &hls
                                    return 'H'
                                  else
                                    return ''
                                  endif
                                endfunction
                                set statusline=
                                set statusline+=%7*\[%n]                                  "buffernr
                                set statusline+=%1*\ %<%F\                                "File+path
                                set statusline+=%2*\ %y\                                  "FileType
                                set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
                                set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
                                set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
                                set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
                                set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
                                set statusline+=%9*\ col:%03c\                            "Colnr
                                set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
                                hi User1 guifg=#ffdad8  guibg=#880c0e
                                hi User2 guifg=#000000  guibg=#F4905C
                                hi User3 guifg=#292b00  guibg=#f4f597
                                hi User4 guifg=#112605  guibg=#aefe7B
                                hi User5 guifg=#051d00  guibg=#7dcc7d
                                hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
                                hi User8 guifg=#ffffff  guibg=#5b7fbb
                                hi User9 guifg=#ffffff  guibg=#810085
                                hi User0 guifg=#ffffff  guibg=#094afe
                        " }}}
                
                        " 'fugitive git' {{{
                                " https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
                                "set statusline= " Override default
                                "set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git
                                "info
                                "set statusline+=%2*\ %f\ %m\ %r%* " Show filename/path
                                "set statusline+=%3*%=%* " Set right-side status info after this line
                                "set statusline+=%4*%l/%L:%v%* " Set <line number>/<total lines>:<column>
                                "set statusline+=%5*\ %* " Set ending space
                        " }}}
                " }}}

                " Airline {{{
                        "let g:airline#extensions#tabline#enabled = 1
                        let g:airline#extensions#bufferline#enabled = 1

                        " * enable/disable syntastic integration >
                        let g:airline#extensions#syntastic#enabled = 1
                        " * enable/disable tagbar integration >
                        let g:airline#extensions#tagbar#enabled = 1
                        " * enable/disable showing a summary of changed hunks under source control. >
                        let g:airline#extensions#hunks#enabled = 1

                        " * enable/disable fugitive/lawrencium integration >
                        let g:airline#extensions#branch#enabled = 1
                        
                        " * change the text for when no branch is detected >
                        let g:airline#extensions#branch#empty_message = ''

                        let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
                        let g:airline#extensions#promptline#enabled = 1
                        let airline#extensions#promptline#color_template = 'normal'

                " }}}
        " }}}

" }}}


" Behavior and Function {{{
        set magic       " regex
        set smarttab
        set expandtab
        set softtabstop=4
        set tabstop=8   " width of an actual \t
        "set backspace=indent,eol,start
        set shiftround  " experimental, remove if annoying or unnoticed

        set ttyfast     " if using vim in the normal way, this makes drawing faster
        set splitright  " otherwise vsplit opens up on the left side

        set noerrorbells
        set novisualbell

        set scrolloff=8 "Start scrolling when we're 8 lines away from margins
        set sidescrolloff=15
        set sidescroll=1

        set wrap
        set textwidth=0

        " ctrlp {
                let g:ctrlp_default_input = 'gitc/'
                let g:ctrlp_clear_cache_on_exit = 1 " ctrlp: cache across sessions
                let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'


        " Starting from vim 7.3 undo can be persisted across sessions {
                " http://www.reddit.com/r/vim/comments/kz84u/ ...
                " what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe

                if has("persistent_undo")
                    set undodir=$HOME/.vim/undodir
                    set undofile
                endif

        " Return to last edit position when opening files (You want this!) {
                augroup persistent_editing_position
                        autocmd!
                        autocmd BufReadPost *
                             \ if line("'\"") > 0 && line("'\"") <= line("$") |
                             \ exe "normal! g`\"" |
                             \ endif
                        " Remember info about open buffers on close
                        set viminfo^=%
                augroup END


        " Promptline {{{
                " sections (a, b, c, x, y, z, warn) are optional
                let g:promptline_preset = {
                        \'a' : [ promptline#slices#host(), promptline#slices#battery() ],
                        \'b' : [ promptline#slices#user() ],
                        \'c' : [ promptline#slices#cwd() ],
                        \'x' : [ promptline#slices#git_status() ],
                        \'y' : [ promptline#slices#vcs_branch() ],
                        \'warn' : [ promptline#slices#last_exit_code() ]}

                " to disable powerline symbols
                let g:promptline_powerline_symbols = 0

                let g:airline_left_sep = '▶'
                let g:airline_right_sep = '◀'

                if has('gui_running')
                        "let g:airline_symbols.linenr = '␊'
                        let g:airline_symbols.linenr = '␤'
                        "let g:airline_symbols.linenr = '¶'

                        let g:airline_symbols.branch = '⎇'

                        "let g:airline_symbols.paste = 'ρ'
                        let g:airline_symbols.paste = 'Þ'
                        "let g:airline_symbols.paste = '∥'

                        let g:airline_symbols.whitespace = 'Ξ'
                endif

                "let g:promptline_preset = 'full'
                "let g:promptline_theme = 'jelly'
        " }}}
" }}}


" Key mapping {{{
        let mapleader = ',' " alt: '\'
        let maplocalleader = '\\'

        " plugin hotkey config {
                let g:ctrlp_map = '<c-p>'
                noremap <leader>u <ESC>:GundoToggle<RETURN>

        " navigation {{{
                " edit my vimrc {
                        nnoremap <leader>ev :split $MYVIMRC<CR>

                " open previous buffer in new window {
                        nnoremap <leader>bp :execute "aboveleft split" bufname("#")<CR>

                " use command-[ command-] to navigate (instead of command-{}) {{{
                        nnoremap <D-[> :tabprev<CR>
                        inoremap <D-[> :tabprev<CR>
                        vnoremap <D-[> :tabprev<CR>
                        nnoremap <D-]> :tabnext<CR>
                        inoremap <D-]> :tabnext<CR>
                        vnoremap <D-]> :tabnext<CR>
                " }}}
        " }}}

        " allow use of :w!! to write file using sudo {
                cnoremap w!! %!sudo tee > /dev/null %

        " Clear my search {
                nnoremap <silent> <leader>/ :nohlsearch<CR>

        " Sidescrolling {
                noremap <C-L> zl
                noremap <C-H> zh


        " F4/F5: Run this file (&save) {{{
                noremap <silent> <F5> <esc>:w<CR><esc>:!./%<CR>
                nnoremap <F4>   :w<Enter>:!python %<Enter>
                inoremap <F4>   <Esc>:w<Enter>:!python %<Enter>
                nnoremap <F4>   :!python %<Enter>
        " }}}

        " substitutions/changes/toggles {
                noremap <leader>bt :call ToggleBool()<RETURN>

        " optional toggles {
                function! ToggleFoldcolumn()
                        if or(!exists('&foldcolumn'), &foldcolumn)
                                set foldcolumn=0
                        else
                                set foldcolumn=4
                        endif
                endfunction

                nnoremap <leader>fc :call ToggleFoldcolumn()<CR>
                nnoremap <leader>n :set relativenumber!<CR>
 

        " reassigning builtins {{{
                " ;esc {{{

                        " A)
                        "        nnoremap ; :
                        "        nnoremap <leader>; ;

                        " or B)
                        "        nnoremap ;; <Esc>
                        "        vnoremap ;; <Esc>
                        "        onoremap ;; <Esc>
                        "        inoremap ;; <Esc>
                        "        nnoremap <leader>; ;

                        " ; normally repeats f<char>. 
                        " vim lags while waiting for second ;.
                " }}}


                " Let space do its page down thang {
                        nnoremap <Space>    <C-F>
                        nnoremap <S-Space>  <C-B>

                " Reassign arrow keys {{{
                        noremap <down> <ESC>:bn<RETURN>
                        noremap <left> <ESC>:NERDTreeToggle<RETURN>
                        noremap <right> <ESC>:TagbarToggle<CR>
                        noremap <leader><right> <ESC>:Tlist<RETURN>    " taglist
                        noremap <up> <ESC>:bp<RETURN>
                " }}}
        " }}}


        " Directory shortcuts {{{
                let sd = $HOME."/gitclones/syncdoc"
                noremap <leader>sd :exec "cd ".sd<RETURN>
                let gocode = $HOME."/gitclones/code"
                noremap <leader>gocode :exec "cd ".gocode
                noremap <leader>cd :cd %:p:h<RETURN>

                function! Golib()
                        aboveleft split ~/gitclones/code/lib/pylib
                endfunction
        " }}}
" }}}




" Stuff I might one day find interesting {{{
        " hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
        " hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
        " hi User3 guifg=#ff66ff guibg=#222222
        " hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
        " hi User5 guifg=#eeee40 guibg=#222222
        "
        " " Set 7 lines to the cursor - when moving vertically using j/k
        " set scrolloff=7
" }}}

" Tips, not settings. {{{
        " where was an option set
        " :scriptnames : list all plugins, _vimrcs loaded (super)
        " :verbose set history? : reveals value of history and where set
        " :function : list functions
        " :func SearchCompl : List particular function
" }}}

" Toys {
        echo '>^.^<'
