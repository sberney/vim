" check for python support
if !has('python')
        echo 'Error: Requires vim compiled with +python'
        finish
endif

python << EOF
booltable = {'True':'False', 'true':'false', 't':'f', 'T':'F', '1':'0', 'TRUE':'FALSE'}
for key in booltable.keys():
        booltable[booltable[key]] = key
EOF

function! ToggleBool()
python << EOF
import vim

def main():
    def toggle_bool(bool):
        '''Given a bool (as a string), this returns its negation.'''
        table = booltable
        return table[bool]

    # get current location

    row, col = vim.current.window.cursor
    line = vim.current.buffer[row-1]

    # find location of word to be replaced in buffer

    EOW, pos = False, col
    while not EOW and pos < len(line):
            char = line[pos]
            if char == ' ':
                    EOW = True
            else:
                pos += 1

    try:
            notbool = toggle_bool(line[col:pos])
    except:
            print('Boolean "{}" not recognized.'.format(line[col:pos]))
            return

    # replace

    replacement = list(line)
    replacement[col:pos] = list(notbool)
    vim.current.buffer[row-1] = "".join(replacement)
    return

main()
EOF
endfunction

function! GotoBool()
python << EOF
import vim, re
row, col = vim.current.window.cursor
line = vim.current.buffer[row-1]

matchstrings = booltable.keys()
matchstrings.sort(key=lambda a: len(a), reverse=True)
boolre = 'inevermatchbecauseimnotdone'

match = re.search(boolre, line)
vim.current.window.cursor = (row, match.start())
EOF
endfunction
