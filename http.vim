function! Gurl (...)
    echom "start"
    if len(a:0) > 0 " any arguments?
        try
            if exists(a:1)
                let url = a:1
                echom "hello"
            endif
        catch
            try
                if exists(a:firstline)
                    let url = "samuelberney.com"
                    "let url = yank
                    echom "hola"
                endif
            catch
                let url = "samberney.com"
            endtry
        endtry
    endif

    "url = :yank
    "let url = yank

    "any splitting
    "vne
    "new

    "data getting
    let expr = "r !curl " . url
    execute expr
    "execute("r !w3m -dump ". url)
endfunction

"command! -nargs=1 Gurl call Gurl(<q-args>)
command! -range Gurl <line1>,<line2>call Gurl()
"http://codeheartjs.com/examples/pathfinding/findPath.js
