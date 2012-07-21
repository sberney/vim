" Universe Fragment's .vimrc { 
" iffothen/sol
" For beautious terminal shells, remember to set 256 colors in the your .profile
" But that's awful, because there is no background image. At least the theme displays a bit.
" In 256 color, lodestone is all right, molokai is great, and zenburn is zenburn
"	on y va
" }

" Behavior {
	set nocompatible " vim is not vi.
	set incsearch " Incremental search
	set splitright " otherwise vsplit opens up on the left side... 'doh.
	set wildmenu " make a beautiful bottomofscree tab autocomplete
		" menu, yeah.
	" set wildmode=list:longest " turn on wild mode huge list
" }

" Visualaid {
 	syntax on " do some highlighting
	set number " keep numbering on

        " Visualfocus {
                set hlsearch " let hlsearch       

                set cursorline "highlight the current line
                "set cursorcolumn " highlight the current column
                ":hi CursorLine cterm=NONE ctermbg=yellow ctermfg=darkgrey guibg=darkred guifg=white
                ":hi CursorColumn cterm=NONE ctermbg=yellow ctermfg=darkgrey guibg=darkred guifg=white
        " }
        
        " mark anything over 80 characters red:
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        nmap mm :match OverLength /\%>80v.\+/
        nmap mn :match None
        
        set showcmd " displays uncompleted commands, when they exist
		" in lower corner of window.
	set laststatus=2 " make the white bar at the bottom appear.
	set report=0 " tell us when anything is change via :...
	set ruler " position of cursor display

	
" }

" Eyecandy {
	"set background=dark " make vim beautiful.
        let g:zenburn_high_Contrast = 1 " For bright rooms.
	"colorscheme molokai " starburst flavored.
        set background=light
        colorscheme solarized " light cscheme
        "colorscheme lodestone " 'ok' colorscheme
        "colorscheme blackboard " for python
" }

" Editing {

	" tabbing {
	        set autoindent " use the indentation of the surrounding text
		set expandtab "get rid of "tabs"
		set shiftwidth=4 " auto-indent amount when using cindent
		set softtabstop=4 " backspace stuff
		set tabstop=8 " actualtabs' widths
	        set backspace=indent,eol,start
	" }

        " python {
                set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
                au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
                set foldmethod=indent " folds based on indentation
                "so ~/.vim/py.vim

                " Generate tags with: ctags -R -f ~/.vim/tags/python24.ctags /usr/lib/python2.4/
                " ctrl-[ to go to the tag under the cursor, ctrl-T to go back.
                set tags+=$HOME/.vim/tags/python24.ctags

        "  }

	"set ignorecase
	"set infercase
	"set nowrap
" }	

" Key remapping {

        " ; {
        	" imap ;; <Esc> " move the fracking escape key
        	nnoremap ;; <Esc>
        	vnoremap ;; <Esc>
        	onoremap ;; <Esc>
        	inoremap ;; <Esc>
        
                " And this of course screws up the default ; command:
                nnoremap ,; ;
        
                " and make it easier to type vim commands
                nnoremap ; :
        " }


        " I'm tired of searching for glkjgkl to clear my search
        nmap <silent> ,/ :nohlsearch<CR>

	" smart bracketing {
		map \p bi(<Esc>ea)<Esc>
	" }

	
	" space /shift-space scroll in normal mode {
        	noremap <S-space> <C-b> " doesn't work.
        	noremap <space> <C-f>
        " }

	" Make arrow keys useful again {
		map <down> <ESC>:bn<RETURN>
		map <left> <ESC>:NERDTreeToggle<RETURN>
		map <right> <ESC>:Tlist<RETURN>
		map <up> <ESC>:bp<RETURN>
	" }
" }

" Tips, not settings. {
	" where was an option set
		" :scriptnames : list all plugins, _vimrcs loaded (super)
		" :verbose set history? : reveals value of history and where set
		" :function : list functions
		" :func SearchCompl : List particular function

	" set t_Co=256


" }
