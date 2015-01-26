
alias m="mate ."
alias gst="git status -sb"
alias gcob='git checkout -b'
alias gcom='git checkout master'

alias ss="script/start"

alias rake='noglob rake'
alias brake="bundle exec rake"
alias be="bundle exec"
alias migrate="bundle exec rake db:migrate ; bundle exec rake db:migrate RAILS_ENV=test"
alias emigrate="bundle exec rake app:db:migrate ; bundle exec rake app:db:migrate RAILS_ENV=test"
alias solr="bundle exec rake solr:create_core ; bundle exec rake solr:create_core  RAILS_ENV=test"

alias glog="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset)  %C(bold red)— %an%C(reset)%C(bold magenta)%d%C(reset)' --abbrev-commit --date=relative"
alias gl="git --no-pager log --graph -n 20 --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold red)— %an%C(reset)%C(bold magenta)%d%C(reset)' --abbrev-commit --date=relative"

alias guc="git reset --soft 'HEAD^'"

alias changes='git log --pretty=format: --name-only --since="last year" | sort | uniq -c | sort -rg | grep -v Gemfile | grep -v "config/" | grep -v ".gemspec" |  head -50'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

alias r="rake"
alias rts="rake test:selenium"
alias rtu="rake test:units"

alias b="bundle"
alias bl="bundle --local"
