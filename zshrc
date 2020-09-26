# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# oh-my-zsh-plugins
plugins=(
  git
  dotenv
  osx
  nvm
  yarn
  zsh-autosuggestions
)

# Docker blitz
blitz-docker-all() {
  docker container rm -f $(docker container ls -a -q)
  docker image rm -f $(docker image ls -q)
  docker volume rm $(docker volume ls -q)
  docker network rm $(docker network ls -q)
}

blitz-docker-containers() {
  docker container rm -f $(docker container ls -a -q)
}

blitz-docker-mid() {
  docker container rm -f $(docker container ls -a -q)
  docker volume rm $(docker volume ls -q)
}

# weather
alias weather='curl -4 http://wttr.in/London'

# speedtest
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z
. $(brew --prefix)/etc/profile.d/z.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Use vi-mode
set -o vi

# Remap Ctrl-R to backward-search
bindkey "^R" history-incremental-search-backward
