
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# deno
export DENO_INSTALL="/$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# rust
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$PATH

export PATH=/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# oh-my-zsh-plugins
plugins=(
  alias-tips
  git
  osx
  nvm
  yarn
  zsh-autosuggestions
  zsh-nvm
  deno
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

# delete all non-master git branches
alias git-blitz='git branch | grep -v "master" | xargs git branch -D'

alias cat='bat --style=plain'

# Add thefuck
eval $(thefuck --alias)

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

eval $(thefuck --alias)

alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
