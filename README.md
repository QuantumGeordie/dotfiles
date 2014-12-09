# dotfiles

run setup from the dotfiles source directory to link the files to your home directory.

the private file should be handled manually if you want to do that.

* .zshrc
   `.zshrc -> ~/src/dotfiles/.zshrc`
* .alias.sh
   `.alias.sh -> ~/src/dotfiles/.alias.sh`
* .env.sh
   `.env.sh -> ~/src/dotfiles/.env.sh`
* .functions.sh
  `.functions.sh -> ~/src/dotfiles/.functions.sh`
* ges.zsh-theme
  `ln -s ~/src/dotfiles/oh-my-zsh/ges.zsh-theme ~/.oh-my-zsh/custom/ges.zsh-theme`
## .private.sh
* `cp ~/src/dotfiles/.private.sh.template ~/src/dotfiles/.private.sh`
* fill in the private info that should be kept private (.gitignore will not allow .private.sh to be included in repo)
* `ln -s ~/src/dotfiles/.private.sh ~/.private.sh`

how's that?