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

bundle() {
  # Call the real Bundler with all arguments properly expanded
  command bundle "$@"

  # Only run extra logic if:
  # 1) Bundler succeeded
  # 2) DISABLE_BUNDLE_SYMLINK is not set
  # 3) The first argument is "install" or no arguments were passed
  if [[ $? -eq 0 && -z "$DISABLE_BUNDLE_SYMLINK" && ( "$1" = "install" || $# -eq 0 ) ]]; then
    # Determine the root directory of the Gemfile
    rootdir=$(bundle exec 'echo $BUNDLE_GEMFILE')
    gemdir="$(dirname "$rootdir")/.bundle/gems"

    # Clear and recreate the gems directory
    rm -rf "$gemdir"
    mkdir -p "$gemdir"

    echo "Symlinking bundle into $gemdir"

    # Symlink all gems from Bundler into this directory, excluding common VCS and temp dirs
    bundle show --paths \
      | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} -v "$(pwd)" \
      | xargs -L 1 -I {} ln -s "{}" "$gemdir"
  fi
}

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    nvm use default
  fi
}


