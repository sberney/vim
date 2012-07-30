if has('unix') || has('mac')
    if $USER == 'obienano'
        set runtimepath=~/sam/.vim,$VIMRUNTIME
        so ~/sam/.vim/.vimrc
    elseif $USER == 'nanograv'
        set runtimepath=~/sberneyism/.vim,$VIMRUNTIME
        so ~/sberneyism/.vim/.vimrc
    else
        so ~/.vim/.vimrc
        set runtimepath=~/.vim,$VIMRUNTIME
    endif

    set background=dark " very necessary on linux

elseif has('win32')
    " This is the WIndows equivlent of .vimrc.
    " The majority of this file was automatically generated,
    " however You will find that it sources .vimrc, and sets
    " the runtimepath to be .vim. You will also find commented
    " out stuff from before this sourced .vimrc and changed
    " the path.
    
    " Begin auto-gen'd stuff
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin    " removing this doesn't fix ctrl+v
    
    set diffexpr=MyDiff()
    function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '\"' . arg1 . '\"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '\"' . arg2 . '\"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '\"' . arg3 . '\"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '\"' . $VIMRUNTIME . '\diff\"'
          let eq = '\"\"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '\" ', '') . '\diff\"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
    
    " Non-auto-gen'd stuff
    cd \Users\Sam
    set runtimepath=\Users\Sam\.vim,$VIMRUNTIME
    so \Users\Sam\.vim\.vimrc
endif

