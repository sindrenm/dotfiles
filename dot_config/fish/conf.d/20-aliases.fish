if type -q eza
  alias l="eza"
  alias ll="eza --long --git --icons"
  alias lt="eza --long --git --icons --tree"
end

if type -q git
  alias g="git"
end

# Enable colors
alias grep="grep --color=always"
alias tree="tree -C"
alias less="less -R"
