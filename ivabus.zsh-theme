# ivabus zsh prompt theme
__zsh_prompt() {
  # set basic prompt with "USERNAME@HOSTNAME "
  if [[ $UID == 0 || $EUID == 0 ]]; then
    PROMPT="%F{red}%n%f@%F{red}%m "
  else
    PROMPT="%F{green}%n%f@%F{cyan}%m "
  fi
  # add to current prompt arrow or [exitcode] if non 0
  PROMPT+='%(?:%f➜ :%B%F{red}%(?..[%?]) )%b'
  # add current working directory
  PROMPT+='%B%F{blue}%(5~|%-1~/…/%3~|%4~)%f%b '
  # add $ or #
  if [[ $UID == 0 || $EUID == 0 ]]; then
    PROMPT+='%F{red}# %f'
  else
    PROMPT+='%F{white}$ %f'
  fi
  unset -f __zsh_prompt
}
__zsh_prompt