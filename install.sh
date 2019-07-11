#!/bin/bash
echo "INSTALLING"

homebrew=/usr/local/Homebrew
rcm=/usr/local/Cellar/rcm
shell=$( echo $SHELL)
localRepo="$HOME/dotfiles"
localGit="/usr/local/bin/git"
ohMyZsh="$HOME/.oh-my-zsh"
syntaxHighlighting="$HOME/.oh-my-zsh/zsh-syntax-highlighting"

echo "---------------------------------------------------------"

if [ ! -d "$homebrew" ]; then
  echo "Homebrew not installed, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Done!"
else
  echo "Homebrew installed"
fi

echo "---------------------------------------------------------"

if [ ! -d "$rcm" ]; then
  echo "rcm not installed, installing"
  brew tap thoughtbot/formulae
  brew install rcm
  echo "Done!"
else
  echo "rcm installed"
fi

packages=(
"cmake",
"git"
"netcat"
"nvm"
"tmux"
"vim"
"yarn"
"z"
"zsh"
)

for i in "${packages[@]}"
do
  installed=$(brew list | grep -w $i)
  if [ ! "$installed" ]; then
    echo "$i not installed, installing"
    brew install $i
    echo "$i installed"
    echo "---------------------------------------------------------"
  fi
done

echo "---------------------------------------------------------"

caskPackages=(
  "iterm2"
  "authy"
  "caffeine"
  "docker"
  "karabiner-elements"
  "postman"
  "rocket"
  "sizeup"
  "visual-studio-code"
  "firefox"
  "google-chrome"
)

for i in "${caskPackages[@]}"
do
  installed=$(brew cask list | grep -w $i)
  if [ ! "$installed" ]; then
    echo "$i not installed, installing"
    brew cask install $i
    echo "$i installed"
    echo "---------------------------------------------------------"
  fi
done

if [ -f "$localGit" ]
then
  echo "git installed"
else
  echo "git is not installed"
fi

echo "---------------------------------------------------------"

if [ -d "$localRepo" ]; then
  echo "dotfiles repo found at ~/"
  else 
  echo "Cloning dotfiles"
  git clone https://github.com/freddyfallon/dotfiles.git ~/dotfiles
  echo "dotfiles now cloned to ~/"
fi

echo "---------------------------------------------------------"

if [ "$shell" != "/bin/zsh" ]; then

echo "---------------------------------------------------------"

echo "Changing to zsh"
chsh -s $(which zsh)
echo "You'll need to log out for this to take effect"

else
  echo "zsh installed"
fi

echo "---------------------------------------------------------"

if [ -d "$ohMyZsh" ]; then
  echo "oh-my-zsh installed"
else
  echo "oh-my-zsh not installed, installing"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "oh-my-zsh installed"
fi

echo "---------------------------------------------------------"

if [ -d "$syntaxHighlighting" ]; then
  echo "zsh syntax highlighting installed"
else
  echo "zsh syntax highlighting not installed, installing"
  cd $HOME/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git && cd -
  echo "zsh syntax highlighting installed"
fi

echo "---------------------------------------------------------"

cd $HOME
echo "Running rcup command"
echo "This symlinks the rc files in dotfiles"
echo "with the rc files in $HOME"

env RCRC=$HOME/dotfiles/rcrc rcup

echo "---------------------------------------------------------"
