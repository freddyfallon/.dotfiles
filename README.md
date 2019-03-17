# My dotfiles
This repo allows me to share and sync dotfiles across different computers.

### Installation

Make sure that you clone this repo into your home directory:

```
git pull git@github.com:freddyfallon/dotfiles.git
```

The following should be automatically installed when you first open Vim, but if for some weird reason it doesn't work, you can install them manually:

1. [vim-plug](https://github.com/junegunn/vim-plug): Follow the instructions on the GitHub repo's README
2. [The Silver Searcher](https://github.com/ggreer/the_silver_searcher): Again, follow the install instructions in the repo's README.

Install [rcm](https://github.com/thoughtbot/rcm):

```
brew tap thoughtbot/formulae
brew install rcm
```

You should then install the dotfiles by running:

```
env RCRC=$HOME/dotfiles/rcrc rcup
```
After the initial installation, you can run `rcup` without the one-time variable RCRC being set (rcup will symlink the repo's rcrc to ~/.rcrc for future runs of rcup).

This command will create symlinks for config files in your home directory. Setting the RCRC environment variable tells rcup to use standard configuration options:

Exclude `README.md`, which is part of the dotfiles repository but does not need to be symlinked in.

Everything should simply work once you run Vim for the first time.

### Updates

From time-to-time, run a `git pull` on this repo and then run:

```
rcup
```
