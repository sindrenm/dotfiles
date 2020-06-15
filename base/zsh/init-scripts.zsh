# Initialize rbenv
eval "$(rbenv init -)"

# Initialize nodenv
eval "$(nodenv init -)"

# Initialize pyenv
eval "$(pyenv init -)"

# Initialize wd
wd() {
  . /usr/share/wd/wd.sh
}

# Initialize direnv
eval "$(direnv hook zsh)"
