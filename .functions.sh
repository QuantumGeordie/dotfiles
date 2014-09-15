mp() { man -t $@ | open -f -a /Applications/Preview.app ;}
gs() { git rebase -i HEAD~$@; }