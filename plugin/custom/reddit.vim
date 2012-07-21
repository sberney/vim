" To check if your version of vim has +python, use
" vim --version | grep +python .
" 
" from http://brainacle.com/how-to-write-vim-plugins-with-python.html
if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

" An easy api to set timeout from in vim
if !exists("g:reddit_apicall_timeout")
    let g:reddit_apicall_timeout=40
endif


" The following allows :call Reddit() to be performed.
function! Reddit()

" We start the python code like the next line.

python << EOF
# the vim module contains everything we need to interface with vim from
# python. We need urllib2 for the web service consumer.
import vim, urllib2
# we need json for parsing the response
import json

# we define a timeout that we'll use in the API call. We don't want
# users to wait much.
TIMEOUT = 20
URL = "http://reddit.com/.json"

try:
    # Get the posts and parse the json response
    response = urllib2.urlopen(URL, None, TIMEOUT).read()
    json_response = json.loads(response)

    posts = json_response.get("data", "").get("children", "")

    # vim.current.buffer is the current buffer. It's list-like object.
    # each line is an item in the list. We can loop through them delete
    # them, alter them etc.
    # Here we delete all lines in the current buffer
    del vim.current.buffer[:]

    # Here we append some lines above. Aesthetics.
    vim.current.buffer[0] = 80*"-"

    for post in posts:
        # In the next few lines, we get the post details
        post_data = post.get("data", {})
        up = post_data.get("ups", 0)
        down = post_data.get("downs", 0)
        title = post_data.get("title", "NO TITLE").encode("utf-8")
        score = post_data.get("score", 0)
        permalink = post_data.get("permalink").encode("utf-8")
        url = post_data.get("url").encode("utf-8")
        comments = post_data.get("num_comments")

        # And here we append line by line to the buffer.
        # First the upvotes
        vim.current.buffer.append("↑ %s"%up)
        # Then the title and the url
        vim.current.buffer.append("    %s [%s]"%(title, url,))
        # Then the downvotes and number of comments
        vim.current.buffer.append("↓ %s    | comments: %s [%s]"%(down, comments, permalink,))
        # And last we append some "-" for visual appeal.
        vim.current.buffer.append(80*"-")

except Exception, e:
    print e

EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction


" The following allows :Reddit to be called.
command! -nargs=0 Reddit call Reddit()


" The following exemplifies argument usage.
function! SomeName(arg1, arg2, arg3)
    " Get the first argument by name in VimL
    let firstarg=a:arg1

    " Get the second argument by position in Viml
    let secondarg=a:1

    " Get the arguments in python

    python << EOF
    import vim

    first_argument = vim.eval("a:arg1") #or vim.eval("a:0")
    second_argument = vim.eval("a:arg2") #or vim.eval("a:1")

EOF
endfunction


" The following selects the entire document.
nmap <C-c> :py vim.command('normal ggvG')
nmap <S-c> ggvG


" To get the global reddit_apicall_timeout:
"TIMEOUT = vim.eval("g:reddit_apicall_timeout")


" To override any !exists(...) setting... .vimrc-ify
"let g:reddit_apicall_timeout=60
