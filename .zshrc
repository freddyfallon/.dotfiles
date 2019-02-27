# Path to your oh-my-zsh installation.
export ZSH="/Users/freddyfallon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

# weather
alias weather='curl -4 http://wttr.in/London'

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z
. `brew --prefix`/etc/profile.d/z.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
