# Simple theme based on my old zsh settings.

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[cyan]%}⇒%{$reset_color%} '
RPROMPT='$(git_prompt_info) %{$fg[cyan]%}%~%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}'
