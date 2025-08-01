if type -q eza
  alias l="eza --long --git"
  alias ll="eza --all --long --git"
end

if type -q git
  alias g="git"
end

# Enable colors
alias grep="grep --color=always"
alias tree="tree -C"
alias less="less -R"
