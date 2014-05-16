# Simple theme based on my old zsh settings.

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

amiroot() {
  local user=`whoami`

if [[ "$user" == "root" ]]; then
    echo -n " %{$fg[red]%}$user%{$reset_color%}"
  fi
}

PROMPT='%{$fg[green]%}⇒%{$reset_color%} '
RPROMPT='$(git_prompt_info) %{$fg[cyan]%}%~%{$reset_color%}$(amiroot)%{$fg[magenta]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}'
