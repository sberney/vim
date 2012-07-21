" Pythonfunctions {
if !has('python')
    echo "Error: must use 64 bit vim compiled with +python"
    finish
endif
       
" open an ipython Conque
function! Ipy()
    :ConqueTerm ipython --pylab
endfunction

" Evaluate selected code in python
function! Pyval()
python << EOF
import vim

EOF
endfunction

"x=4
"# Grab `h`ighlighted text, even if one line (no highlight)
"hrange = vim.current.range
"htext = vim.current.buffer[hrange.start:hrange.end+1]
"print("htext is %s" % htext)
"map(eval, htext)    # untested!


command -nargs=0 Ipy
