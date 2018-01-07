
alias gst="git status -sb"
alias gcob='git checkout -b'
alias gcom='git checkout master'

if [ "$TERM_PROGRAM" = "iTerm.app" ]
then
  alias ss='command -v script/istart && script/istart || script/start'
else 
  alias ss='script/start'
fi

alias stop="script/stop"
alias start="ss"

alias rake='noglob rake'
alias brake="bundle exec rake"
alias be="bundle exec"
alias migrate="bundle exec rake db:migrate ; bundle exec rake db:migrate RAILS_ENV=test"
alias m="migrate"
alias emigrate="bundle exec rake app:db:migrate ; bundle exec rake app:db:migrate RAILS_ENV=test"
alias solr="bundle exec rake solr:create_core ; bundle exec rake solr:create_core  RAILS_ENV=test"

alias glog="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset)  %C(bold red)— %an%C(reset)%C(bold magenta)%d%C(reset)' --abbrev-commit --date=relative"
alias gl="git --no-pager log --graph -n 20 --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold red)— %an%C(reset)%C(bold magenta)%d%C(reset)' --abbrev-commit --date=relative"
alias gsha="git log -n1 | head -n1 |  grep -Eo '[a-f0-9]{40}'"
alias guc="git reset --soft 'HEAD^'"
alias gprom="git pull --rebase origin master"

alias changes='git log --pretty=format: --name-only --since="last year" | sort | uniq -c | sort -rg | grep -v Gemfile | grep -v "config/" | grep -v ".gemspec" |  head -50'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

alias r="rake"
alias rts="bundle exec rake test:selenium RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtu="bundle exec rake test:units RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtc="bundle exec rake test:controllers RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtjs="bundle exec rake konacha:run"
alias rta="bundle exec rake test:appearance RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtas="bundle exec rake test:appearance BROWSER_SIZE=small TAG=small RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtam="bundle exec rake test:appearance BROWSER_SIZE=medium TAG=medium RUBY_DEP_GEM_SILENCE_WARNINGS=1"
alias rtal="bundle exec rake test:appearance BROWSER_SIZE=large TAG=large RUBY_DEP_GEM_SILENCE_WARNINGS=1"

alias b="bundle"
alias bl="bundle --local"

alias t="test_launcher"

alias an="bundle exec annotate --exclude tests"
