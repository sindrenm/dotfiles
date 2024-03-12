if type -q exa
  alias l="exa --long --git"
  alias ll="exa --all --long --git"
end

if type -q git
  alias g="git"
end

# Enable colors
alias grep="grep --color=always"
alias tree="tree -C"
alias less="less -R"
