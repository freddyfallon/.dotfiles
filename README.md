# My dotfiles
This repo allows me to share and sync dotfiles across different computers.

### Installation

You will need the following:

1. [vim-plug](https://github.com/junegunn/vim-plug): Follow the instructions on the GitHub repo's README
2. [The Silver Searcher](https://github.com/ggreer/the_silver_searcher): Again, follow the install instructions in the repo's README.

Once you have the two items above, install [rcm](https://github.com/thoughtbot/rcm):

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

Then, open Vim and run:

```
:PlugInstall
```

Now everything should work great.

### Updates

From time-to-time, run a `git pull` on this repo and then run:

```
rcup
```
