" visualGurl
function! VisGurl ()
	url = :yank
	:vne
	:execute("r !w3m -dump" url)" Horizintal split
endfunction

function! GetUrlhs (url)
	:new
	:execute("r !w3m -dump " . a:url )
endfunction

" Veritcal split
function! GetUrlvs (url)
	:vne
	:execute("r !w3m -dump " . a:url )
endfunction

" Nosplit
function! GetUrlns (url)
	:execute("r !w3m -dump " . a:url )
endfunction


" Allow :Gurl http://<address> to be called, or
	" even just :Gurl <address>

" default Gurl is vertical
command -nargs=1 Gurl
\ call GetUrlvs(<q-args>)

" Gurlh is horizontal
command -nargs=1 Gurlh
\ call GetUrlhs(<q-args>)

" Gurli is inline (nosplit)
command -nargs=1 Gurli
\ call GetUrlns(<q-args>)


" functions to chill out with
"nmap <F5> :call Gurl(visualmode())<CR> 

" Enumerate all the colors, putting them in this file.
function! EnumColors()
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
        call append(0, 'ctermbg='.num.':....')
        let num = num - 1
    endwhile
endfunction
