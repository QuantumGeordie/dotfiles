PROMPT="%{$fg[green]%}%~ %{$fg[cyan]%}▷ "
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='$(git_prompt_info) %{$fg[red]%}$(~/.rvm/bin/rvm-prompt v) %{$fg[cyan]%}%n%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[orange]%}⚡%{$fg[yellow]%}"

ZSH_THEME_SVN_PROMPT_CLEAN="[svn]"
ZSH_THEME_SVN_PROMPT_DIRTY="[svn %{$fg[orange]%}⚡%{$fg[yellow]%}]"

