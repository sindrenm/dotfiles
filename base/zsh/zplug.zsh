source /usr/share/zsh/scripts/zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zlsun/solarized-man"

if ! zplug check ; then
    zplug install
fi

zplug load
