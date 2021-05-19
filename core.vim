" vundle {{{
        " vundle requires these things {
                " relotag devient viMprovée ®
                        " set nocompatible
                filetype off
                " relotag vundling hausaufgaben ®
		 set rtp+=~/.vim/bundle/Vundle.vim
                 call vundle#begin('~/.vim/bundle')
        " }

        " vundle ménages vundle
                Plugin 'VundleVim/Vundle.vim'

        " Plugins' package management (Vundle) {{{

                " Fly through vim with visual ease TODO: build out configuration
                Plugin 'Lokaltog/vim-easymotion'

                " Open files below node with fuzzy search
                Plugin 'kien/ctrlp.vim'

                " DistRAction-free writing env: :Goyo [width]
                Plugin 'junegunn/goyo.vim'

                " easy to define substitution rules via subversion and coercion TODO: build out or abandon
                        "Plugin 'tpope/vim-abolish'

                " statusline {
                        " awesome statusline!
                        Plugin 'bling/vim-airline'
                        " change the theme of the airline
                        Plugin 'vim-airline/vim-airline-themes'
                        " exports prompt to shell
                        Plugin 'edkolev/promptline.vim'
                            " Move buffers to command bar... ?Display the buffer number along with the buffer name TODO: verify
                                    "Plugin 'bling/vim-bufferline'
                " }

                " side windows {
                        " File explorer
                        Plugin 'scrooloose/nerdtree'

                        " Graphical undo tree explorer
                        Plugin 'sjl/gundo.vim'

                        " ctags integration {
                                " everyone needs to see their functions in a jumpus list
                                Plugin 'majutsushi/tagbar'
                                " superceded this legacy jumpusius maximinus.
                                        "Plugin 'vim-scripts/taglist.vim'
                        " }
                " }

                " git {
                        " signals [git] diffèrement avec des +/-/~ in its column
                        Plugin 'airblade/vim-gitgutter'
                        " vim fugitive (git int) TODO: comfortablement
                        Plugin 'tpope/vim-fugitive'
                " }

                " syntaxis & IDEntment {{{
                "
                        " Syntax checker (on close) for many languages TODO: explore
                        Plugin 'scrooloose/syntastic'

                        " lua { syntax highlighting.
                                Plugin 'xolox/vim-misc'
                                Plugin 'xolox/vim-lua-inspect'
                        " }

                        " Python ide {
                                Plugin 'klen/python-mode'
                                        " Hangs on period sometimes. Does this fix?
                                                let g:pymode_rope_lookup_project = 0
                                                let g:pymode_rope = 0
                        " }

                        " Clojure {
                                Plugin 'kien/rainbow_parentheses.vim'
                                Plugin 'tpope/vim-fireplace'
                                Plugin 'tpope/vim-leiningen'

                        " }
                        " C# ide {{{
                                Plugin 'tpope/vim-dispatch.git'
                                Plugin 'OrangeT/vim-csharp'
                                "Plugin 'OmniSharp/omnisharp-vim'
                        " }}}


                        " Haskell {
                                Plugin 'raichoo/haskell-vim.git'
                                Plugin 'lukerandall/haskellmode-vim'
                        " }

                        " javascript {
                                " improves syntax recognition => highlighting
                                Plugin 'jelera/vim-javascript-syntax'
                                " enables html/css highlighting in js, code folding, and reduces function => �
                                Plugin 'pangloss/vim-javascript'
                                " uses color blocks to visualize js indents.
                                " toggle with <leader>ig
                                Plugin 'nathanaelkane/vim-indent-guides.git'
                        " }
                " }}}
        " }}}


        " Theme management (Vundle) {{{
            Plugin 'tomasr/molokai'
            Plugin 'altercation/vim-colors-solarized'
            Plugin 'marcus/vim-mustang'
            Plugin 'jnurmine/Zenburn'
            " a javascript optimized colorscheme
            Plugin 'goatslacker/mango.vim'
        " }}}

        " vundle requires these things {
                call vundle#end()
                filetype plugin indent on
        " }
" }}}


" vimfile folding (syntaxis) {{{
        augroup filetype_vim
                autocmd!
                autocmd FileType vim setlocal foldmethod=marker
        augroup END
" }}}


" Visuals and Form {{{
        " Themes and color counts {{{
                "set t_Co=256   " Necessary for many colorschemes.
                "set t_Co=88    " For very sad terminals

                " Solarized {{{
                function! Solarized(lightness)
                        if a:lightness == '' || a:lightness == 'light'
                                set background=light
                        elseif a:lightness == 'dark'
                                set background=dark
                        else
                                echom 'Solarized() received invalid argument'
                        endif
                        colorscheme solarized
                endfunction
                command! -nargs=? Solarized call Solarized('<args>')
                " }}}

                " Zenburn {{{
                function! Zenburn()
                        set background=dark
                        "set background=light

                        "let g:zenburn_high_Contrast = 1 " For bright rooms.
                        "unlet g:zenburn_high_Contrast  " For dark rooms.

                        colorscheme zenburn
                endfunction
                command! -nargs=0 Zenburn call Zenburn()
                " }}}


                if has('gui_running')
                        "colorscheme molokai
                        Zenburn
                        "Solarized light

                elseif !has('gui_running')
                        Zenburn
                endif

                if has('gui_running') && has('win32')
                        set guifont=Consolas:h11:cANSI
                endif
        " }}}

        " Colorization (hilightion, syntaxis) {{{
                syntax on

                " hilightion {{{
                        " relotag smart search
                                "set incsearch
                        set hlsearch

                        " mark anything over 80 characters red
                        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
                        nnoremap mm :match OverLength /\%>80v.\+/<CR>

                        " uncreate custom highlighting, like 80 char redding
                        nnoremap mn :match None<CR>

                        set showmatch   " highlights matching brackets when selected
                        set matchtime=2 " How many tenths of a second to blink when matching brackets
                " }}}
        " }}}

        " thin columns control {{{
                " line numbering : two options {
                        set number
                        "set relativenumber

                        " line number : toggle options  REMAP
                                nnoremap <leader>n :set relativenumber!<CR>
                " }

                " fold column : yes or no {{{
                        "if has('gui_running')      " conserve terminal space
                                set foldcolumn=4    " show FC by default (leader fc toggles)
                        "endif

                        " fold column : toggle options {{{
                                function! ToggleFoldcolumn()
                                        if or(!exists('&foldcolumn'), &foldcolumn)
                                                set foldcolumn=0
                                        else
                                                set foldcolumn=4
                                        endif
                                endfunction "             REMAP
                                nnoremap <leader>fc :call ToggleFoldcolumn()<CR>
                        " }}}
                " }}}

                " Fullscreen settings removes scroll bars, tablines, whatever ... {{{
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
        " }}}

        set cursorline

        " Visualize tabs, trailing whitespaces and funny characters {{{
                " http://www.reddit.com/r/programming/comments/9wlb7/ ...
                " ... proggitors_do_you_like_the_idea_of_indented/c0esam1
                " https://wincent.com/blog/making-vim-highlight-suspicious-characters

                set list
                if HasMac()
                        set listchars=nbsp:¬,tab:»·,trail:·
                else
                        set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
                endif
        " }}}

        " smart search {{{
                set noignorecase
                set incsearch

                set magic       " search regexiness.
                                " search-prepend \v to magicate even more,
                                "                \V to literalize everything
                                "
                                " magic             nomagic
                                " \. literal        \. pattern
                                "  . pattern         . literal
                                " \* literal        \* pattern
                                "  * pattern         * literal

                " Clear my search <leader>/
                nnoremap <silent> <leader>/ :nohlsearch<CR>

                " ctrlp {{{
                        " relotag ctrlp search root !!
                                "let g:ctrlp_default_input = 'gitc/'
                                "let g:ctrlp_cache_dir = $SUPERHOME.'/.cache/ctrlp'

                        let g:ctrlp_clear_cache_on_exit = 1 " ctrlp: cache across sessions
                        let g:ctrlp_max_files = 0
                        let g:ctrlp_custom_ignore = {
                                                \'dir': '\.git$\|tmp$',
                                                \'file': '\.dat$|\.DS_Store$|\.swap$'
                                                \}
                " }}}
        " }}}

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
" }}}


" Behavior and Function {{{
        " tabitude {{{
                let &softtabstop = g:tab_spacing
                let &shiftwidth  = g:tab_spacing
                let &tabstop     = 2 * g:tab_spacing  " width of an actual \t

                " relotag replace tab with spaces !!
                        "set expandtab
                set shiftround  " Round indent to multiple of 'shiftwidth'
                set smarttab    " <BS> deletes a whole tab, not a character. tab indents shiftwidth not [soft]tabstop.

                "augroup tabber
                "        autocmd!
                "        autocmd tabstop = 8
                "        autocmd 
        " }}}

        set backspace=indent,eol,start  " allows (full) backspacing: over
                                                "auto-indents, over newlines,
                                                        "and to before insertion
                                                                "started

        set noerrorbells
        set novisualbell

        set ttyfast     " fast connection -> faster redrawing
        set splitright  " otherwise vsplit opens up on the left side

        set more        " more is less

        set scrolloff       =8      "Start scrolling when we're 8 lines away from margins
        set sidescrolloff  =15
        set sidescroll      =1

        set textwidth=0     " disable line-breaking long lines as you type them

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

        " maybe this should be broken into a windows.vim compatibility file.
        if has('win32')
            set grepprg=grep\ -nH   " windows defaults to findstr
        endif
" }}}


" Key mapping {{{
        "let mapleader = ',' " alt: '\\'
        "let maplocalleader = '\\'

        " plugin hotkey config {
                let g:ctrlp_map = '<c-p>'
                noremap <leader>u <ESC>:GundoToggle<RETURN>
        " }

        " navigation {{{
                " edit my vimrc
                        nnoremap <leader>ev :split $MYVIMRC<CR>
                " edit the header file for this cpp
                        "nnoremap <leader>eh :split $MYVIMRC<CR>

                " open previous buffer in new window
                        nnoremap <leader>bp :execute "aboveleft split" bufname("#")<CR>

                " use command-[ command-] to navigate (instead of command-{}) {{{ " TODO: this is mac only
                        if HasMac()
                                nnoremap <D-[> :tabprev<CR>
                                inoremap <D-[> :tabprev<CR>
                                vnoremap <D-[> :tabprev<CR>
                                nnoremap <D-]> :tabnext<CR>
                                inoremap <D-]> :tabnext<CR>
                                vnoremap <D-]> :tabnext<CR>
                        else
                                nnoremap <A-[> :tabprev<CR>
                                inoremap <A-[> :tabprev<CR>
                                vnoremap <A-[> :tabprev<CR>
                                nnoremap <A-]> :tabnext<CR>
                                inoremap <A-]> :tabnext<CR>
                                vnoremap <A-]> :tabnext<CR>
                        endif
 
                " }}}
        " }}}

        " allow use of :w!! to write file using sudo
                cnoremap w!! %!sudo tee > /dev/null %

        " Sidescrolling
                noremap <C-L> zl
                noremap <C-H> zh

        " Go to next integer
                nnoremap <leader>gi     /\d<CR>
                nnoremap <leader>gI     ?\d<CR>b

        " Moving horizontally across windows
                nnoremap <C-w>ghj <C-w>h<C-w>j
                nnoremap <C-w>gjh <C-w>j<C-w>h
                nnoremap <C-w>ghk <C-w>h<C-w>k
                nnoremap <C-w>gkh <C-w>k<C-w>h
                nnoremap <C-w>gjl <C-w>j<C-w>l
                nnoremap <C-w>glj <C-w>l<C-w>j
                nnoremap <C-w>gkl <C-w>k<C-w>l
                nnoremap <C-w>glk <C-w>l<C-w>k


        " F4/F5: Run this file (&save) {{{
                noremap <silent> <F5> <esc>:w<CR><esc>:!./%<CR>
                nnoremap <F4>   :w<Enter>:!python %<Enter>
                inoremap <F4>   <Esc>:w<Enter>:!python %<Enter>
                nnoremap <F4>   :!python %<Enter>
        " }}}

        " substitutions/changes/toggles
                noremap <leader>bt :call ToggleBool()<RETURN>


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
" }}}

" Stuff I might one day find interesting {{{
        " hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
        " hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
        " hi User3 guifg=#ff66ff guibg=#222222
        " hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
        " hi User5 guifg=#eeee40 guibg=#222222
" }}}
