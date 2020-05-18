# Simple theme based on my old zsh settings.

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function amiroot() {
  local user=`whoami`

  if [[ "$user" == "root" ]]; then
    echo -n " %{$fg[red]%}$user%{$reset_color%}"
  fi
}

function prompt_dir {
  echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
}


function mgit_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Assuming gtm-terminal is sourced

PROMPT='%{$fg[green]%}%j>%{$reset_color%} '
RPROMPT='%{$fg[green]%} ↻ $GTM_STATUS%{$reset_color%} ⎇ $(mgit_prompt_info) %{$fg[cyan]%} $(prompt_dir)%{$reset_color%}$(amiroot)%{$fg[magenta]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}'
