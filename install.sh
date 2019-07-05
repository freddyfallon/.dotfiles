#!/bin/bash
echo "INSTALLING"
homebrew=/usr/local/Homebrew
rcm=/usr/local/Cellar/rcm
shell=$( echo $SHELL)
echo "---------------------------------------------------------"
if [ ! -d "$homebrew" ]; then
  echo "Homebrew not installed, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Setting dotfiles"
  env RCRC=$HOME/dotfiles/rcrc rcup
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
"git"
"tmux"
"vim"
"zsh"
"nvm"
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

localGit="/usr/local/bin/git"
if [ -f "$localGit" ]
then
  echo "git installed"
else
  echo "git is not installed"
fi

echo "---------------------------------------------------------"

if [ "$shell" != "/bin/zsh" ]; then
echo shell

echo "---------------------------------------------------------"

echo "Changing to zsh"
chsh -s $(which zsh)

echo "You'll need to log out for this to take effect"

else
  echo "zsh installed"
fi

echo "---------------------------------------------------------"

cd $HOME
echo "Running rcup command"
echo "This is symlink the rc files in .dofiles"
echo "with the rc files in $HOME"

rcup

echo "---------------------------------------------------------"
