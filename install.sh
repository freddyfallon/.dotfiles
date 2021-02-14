#!/bin/bash
echo "INSTALLING"

homebrew=/usr/local/Homebrew
rcm=/usr/local/Cellar/rcm
shell=$SHELL
localRepo="$HOME/dotfiles"
localGit="/usr/local/bin/git"
ohMyZsh="$HOME/.oh-my-zsh"
syntaxHighlighting="$HOME/.oh-my-zsh/zsh-syntax-highlighting"
zshAutoSuggestions="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/"
zshNvm="$HOME/.oh-my-zsh/custom/plugins/zsh-nvm/"
zshDeno="$HOME/.oh-my-zsh/custom/plugins/deno/"

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
  "cmake"
  "git"
  "jq"
  "netcat"
  "nvm"
  "thefuck"
  "tmux"
  "neovim"
  "vim"
  "yarn"
  "z"
  "zsh"
)

for i in "${packages[@]}"
do
  installed=$(brew list --formula | grep -w "$i")
  if [ ! "$installed" ]; then
    echo "$i not installed, installing"
    brew install "$i"
    echo "$i installed"
    echo "---------------------------------------------------------"
  fi
done

echo "---------------------------------------------------------"

caskPackages=(
  "iterm2"
  "docker"
  "karabiner-elements"
  "rocket"
  "pastebot"
  "visual-studio-code"
  "firefox"
  "brave-browser"
  "insomnia"
)

for i in "${caskPackages[@]}"
do
  installed=$(brew list --cask | grep -w "$i")
  if [ ! "$installed" ]; then
    echo "$i not installed, installing"
    brew install --cask "$i"
    echo "$i installed"
    echo "---------------------------------------------------------"
  fi
done

if [ -f "$localGit" ]; then
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
  chsh -s "$(command -v zsh)"
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

if [ -d "$zshAutoSuggestions" ]; then
  echo "zsh-autosuggestions installed"
else
  echo "zsh-autosuggestions not installed, installing"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "zsh-autosuggestions installed"
fi

echo "---------------------------------------------------------"

if [ -d "$zshNvm" ]; then
  echo "zsh-nvm installed"
else
  echo "zsh-nvm not installed, installing"
  git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
  echo "zsh-nvm installed"
fi

echo "---------------------------------------------------------"

if [ -d "$zshDeno" ]; then
  echo "zsh-deno installed"
else
  echo "zsh-deno not installed, installing"
  git clone https://github.com/denodev/oh-my-zsh-deno  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/deno
  echo "zsh-autosuggestions installed"
fi

echo "---------------------------------------------------------"

if [ -d "$syntaxHighlighting" ]; then
  echo "zsh syntax highlighting installed"
else
  echo "zsh syntax highlighting not installed, installing"
  cd "$HOME/.oh-my-zsh" || exit && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git && cd - || exit
  echo "zsh syntax highlighting installed"
fi



echo "---------------------------------------------------------"
cd "$HOME" || exit
echo "Running rcup command"
echo "This symlinks the rc files in dotfiles"
echo "with the rc files in $HOME"
env RCRC="$HOME/dotfiles/rcrc" rcup
echo "---------------------------------------------------------"
