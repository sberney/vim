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
