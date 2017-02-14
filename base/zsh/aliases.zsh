#! /bin/zsh

# --- COLORING -----------------------------------------------------------------

alias grep='grep --color=always'
alias tree='tree -C'
alias less='less -R'

# --- GIT ----------------------------------------------------------------------

alias g='git'

# --- LS SHORTCUTS -------------------------------------------------------------

alias l='ls -l'
alias la='ls -a'
alias ll='ls -la'

# --- COPY TO X CLIPBOARD ------------------------------------------------------

alias xcp='xclip -selection clipboard'

# --- NAVIGATION ---------------------------------------------------------------

alias wda='wd --add $(basename $PWD)'

# --- OPEN ---------------------------------------------------------------------

alias open=xdg-open
