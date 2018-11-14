mp() { man -t $@ | open -f -a /Applications/Preview.app ;}
gs() { git rebase -i HEAD~$@; }

# from http://brettterpstra.com/2014/08/15/shell-tricks-a-time-to-kill/
# doesn't like to pick up selenium, however. something to do with the ',comm' part of ps Ao blah not working on selenium-server-standalone
fp () { #find and list processes matching a case-insensitive partial-match string
  ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () {
  local cmd OPT
  IFS=$'\n'
  PS3='Kill which process? (q to cancel): '
  select OPT in $(fp $1); do
    if [[ $OPT =~ [0-9]$ ]]; then
      cmd=$(ps -p ${OPT##* } -o command|tail -n 1)
      if [[ "$cmd" =~ "Contents/MacOS" ]] && [[ -f /usr/local/bin/quit ]]; then
        echo "Quitting ${OPT%%:*}"
        cmd=$(echo "$cmd"| sed -E 's/.*\/(.*)\.app\/.*/\1/')
        /usr/local/bin/quit -n "$cmd"
      else
        echo "killing ${OPT%%:*}"
        kill ${OPT##* }
      fi
    fi
    break
  done
  unset IFS
}

function bundle() {
  command bundle "$@"

  if [ $? == 0 ] && [ -z $DISABLE_BUNDLE_SYMLINK ] && ([ "$1" == "install" ] || [ "$#" -eq 0 ]); then
    rootdir=$(bundle exec 'echo $BUNDLE_GEMFILE')
    gemdir="$(dirname $rootdir)/.bundle/gems"
    rm -rf $gemdir
    mkdir -p $gemdir
    echo "Symlinking bundle into $gemdir"
    bundle show --paths | grep -v `pwd` | xargs -L 1 -I {} ln -s {} $gemdir
  fi
}
