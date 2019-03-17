#!/bin/bash
homebrew=/usr/local/Homebrew
rcm=/usr/local/Cellar/rcm
if [ ! -d "$homebrew" ]; then
  echo "Homebrew not installed, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installing rcm"
  brew tap thoughtbot/formulae
  brew install rcm
  echo "Setting dotfiles"
  env RCRC=$HOME/dotfiles/rcrc rcup
  echo "Done!"
elif [ ! -d "$rcm" ]; then
  echo "Homebrew already installed, installing rcm"
  brew tap thoughtbot/formulae
  brew install rcm
  echo "Setting dotfiles"
  env RCRC=$HOME/dotfiles/rcrc rcup
  echo "Done!"
else
  echo "Homebrew and rcm already installed"
  echo "Setting dotfiles"
  env RCRC=$HOME/dotfiles/rcrc rcup
  echo "Done!"
fi
