# ivabus zsh prompt theme
__zsh_prompt() {
  # set basic prompt with "USERNAME@HOSTNAME "
  if [[ $UID == 0 || $EUID == 0 ]]; then
    PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[red]%}%m "
  else
    PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m "
  fi
  # add to current prompt arrow or [exitcode] if non 0
  PROMPT+='%(?:%{$reset_color%}➜ :%{$fg_bold[red]%}%(?..[%?]) )'
  # add current working directory
  PROMPT+='%{$fg_bold[blue]%}%(5~|%-1~/…/%3~|%4~)%{$reset_color%} '
  # and git status
  PROMPT+='$(git_prompt_info)'
  # add $ or #
  if [[ $UID == 0 || $EUID == 0 ]]; then
    PROMPT+='%{$fg[red]%}# %{$reset_color%}'
  else
    PROMPT+='%{$fg[white]%}$ %{$reset_color%}'
  fi
  unset -f __zsh_prompt
}

# setup git status
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%}"
__zsh_prompt

