" Statusline {{{
        set laststatus=2  " always have a statusline!

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
                "        function! HighlightSearch()
                "                if &hls
                "                return 'H'
                "                else
                "                return ''
                "                endif
                "        endfunction
                "        set statusline=
                "        set statusline+=%7*\[%n]                                  "buffernr
                "        set statusline+=%1*\ %<%F\                                "File+path
                "        set statusline+=%2*\ %y\                                  "FileType
                "        set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
                "        set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
                "        set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
                "        set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
                "        set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
                "        set statusline+=%9*\ col:%03c\                            "Colnr
                "        set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
                "        hi User1 guifg=#ffdad8  guibg=#880c0e
                "        hi User2 guifg=#000000  guibg=#F4905C
                "        hi User3 guifg=#292b00  guibg=#f4f597
                "        hi User4 guifg=#112605  guibg=#aefe7B
                "        hi User5 guifg=#051d00  guibg=#7dcc7d
                "        hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
                "        hi User8 guifg=#ffffff  guibg=#5b7fbb
                "        hi User9 guifg=#ffffff  guibg=#810085
                "        hi User0 guifg=#ffffff  guibg=#094afe
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

        " Promptline {{{
                " sections (a, b, c, x, y, z, warn) are optional
                "let g:promptline_preset = {
                "        \'a' : [ promptline#slices#host(), promptline#slices#battery() ],
                "        \'b' : [ promptline#slices#user() ],
                "        \'c' : [ promptline#slices#cwd() ],
                "        \'x' : [ promptline#slices#git_status() ],
                "        \'y' : [ promptline#slices#vcs_branch() ],
                "        \'warn' : [ promptline#slices#last_exit_code() ]}

                set encoding=utf-8

                let g:airline_powerline_fonts = 1

                " to disable powerline symbols
                "let g:promptline_powerline_symbols = 0

                "let g:airline_left_sep = '▶'
                "let g:airline_right_sep = '◀'

                if has('gui_running')
                        "let g:airline_symbols.linenr = '␊'
                        "let g:airline_symbols.linenr = '␤'
                        "let g:airline_symbols.linenr = '¶'

                        "let g:airline_symbols.branch = '⎇'

                        "let g:airline_symbols.paste = 'ρ'
                        "let g:airline_symbols.paste = 'Þ'
                        "let g:airline_symbols.paste = '∥'

                        "let g:airline_symbols.whitespace = 'Ξ'
                endif

                "let g:promptline_preset = 'full'
                "let g:promptline_theme = 'jelly'
        " }}}
" }}}


