" Clojure ide {{{
                au VimEnter * RainbowParenthesesToggle
                au Syntax * RainbowParenthesesLoadRound
        autocmd FileType clj setlocal iskeyword-=/,. "Don't skip slashes or periods when determining word lengths
" }}}

" javascript ide {

    " pangloss
    let g:javascript_enable_domhtmlcss=1
    let b:javascript_fold=1
    let g:javascript_ignore_javaScriptdoc=0

    " conceal/reduce javascript characters {
        let g:javascript_conceal_function   = "�"
        let g:javascript_conceal_null       = "�"
        "let g:javascript_conceal_this       = "@"
        let g:javascript_conceal_return     = "?"
        let g:javascript_conceal_undefined  = "�"
        "let g:javascript_conceal_NaN        = "N"
        "let g:javascript_conceal_prototype  = "�"
        "let g:javascript_conceal_static     = "�"
        "let g:javascript_conceal_super      = "O"
    " }

    " vim-indent-guides
    "(toggle with <Leader>ig )
" }

" C# Configuration {{{ TODO integrate syntaxis more thoroughly. & Make this modal.
        " OmniSharp won't work without this setting
        filetype plugin on

        "This is the default value, setting it isn't actually necessary
        let g:OmniSharp_host = "http://localhost:2000"

        "Set the type lookup function to use the preview window instead of the status line
        "let g:OmniSharp_typeLookupInPreview = 1

        "Timeout in seconds to wait for a response from the server
        let g:OmniSharp_timeout = 1

        "Showmatch significantly slows down omnicomplete
        "when the first match contains parentheses.
        set noshowmatch

        "Super tab settings - uncomment the next 4 lines
        "let g:SuperTabDefaultCompletionType = 'context'
        "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        "let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
        "let g:SuperTabClosePreviewOnPopupClose = 1

        "don't autoselect first item in omnicomplete, show if only one item (for preview)
        "remove preview if you don't want to see any documentation whatsoever.
        set completeopt=longest,menuone,preview
        " Fetch full documentation during omnicomplete requests.
        " There is a performance penalty with this (especially on Mono)
        " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
        " you need it with the :OmniSharpDocumentation command.
        " let g:omnicomplete_fetch_documentation=1

        "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
        "You might also want to look at the echodoc plugin
        set splitbelow

        " Get Code Issues and syntax errors
        let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

        augroup omnisharp_commands
            autocmd!

            "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
            autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

            " Synchronous build (blocks Vim)
            "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
            " Builds can also run asynchronously with vim-dispatch installed
            autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
            " automatic syntax check on events (TextChanged requires Vim 7.4)
            autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

            " Automatically add new cs files to the nearest project on save
            autocmd BufWritePost *.cs call OmniSharp#AddToProject()

            "show type information automatically when the cursor stops moving
            autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

            "The following commands are contextual, based on the current cursor position.

            autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
            autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
            autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
            autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
            autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
            "finds members in the current buffer
            autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
            " cursor can be anywhere on the line containing an issue
            autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
            autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
            autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
            autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
            "navigate up by method/property/field
            autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
            "navigate down by method/property/field
            autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

        augroup END


        " this setting controls how long to wait (in ms) before fetching type / symbol information.
        set updatetime=500
        " Remove 'Press Enter to continue' message when type information is longer than one line.
        set cmdheight=2

        " Contextual code actions (requires CtrlP)
        nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
        " Run code actions with text selected in visual mode to extract method
        vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

        " rename with dialog
        nnoremap <leader>nm :OmniSharpRename<cr>
        nnoremap <F2> :OmniSharpRename<cr>
        " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
        command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

        " Force OmniSharp to reload the solution. Useful when switching branches etc.
        nnoremap <leader>rl :OmniSharpReloadSolution<cr>
        nnoremap <leader>cf :OmniSharpCodeFormat<cr>
        " Load the current .cs file to the nearest project
        nnoremap <leader>tp :OmniSharpAddToProject<cr>

        " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
        nnoremap <leader>ss :OmniSharpStartServer<cr>
        nnoremap <leader>sp :OmniSharpStopServer<cr>

        " Add syntax highlighting for types and interfaces
        nnoremap <leader>th :OmniSharpHighlightTypes<cr>
        "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
        set hidden


        au BufRead,BufNewFile *.cs set filetype=csharp
        au BufRead,BufNewFile *.cs setfiletype=csharp

        au FileType cs set omnifunc=syntaxcomplete#Complete
        "au FileType cs set foldmethod=marker
        "au FileType cs set foldmarker={,}
        "au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
        "au FileType csharp setlocal foldlevelstart=1
        au FileType csharp setlocal foldmethod=indent
        au FileType csharp setlocal foldlevel=0

" }}}
