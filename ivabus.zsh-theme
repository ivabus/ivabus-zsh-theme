# ivabus zsh prompt theme
__zsh_prompt() {
    local prompt_username
    prompt_username="%n"
    local prompt_hostname
    prompt_hostname="%m"
    if [[ $UID == 0 || $EUID == 0 ]]; then
        PROMPT="%{$fg[red]%}${prompt_username}%{$reset_color%}@%{$fg[red]%}${prompt_hostname} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )"
    else
        PROMPT="%{$fg[green]%}${prompt_username}%{$reset_color%}@%{$fg[cyan]%}${prompt_hostname} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )" # User/exit code arrow
    fi
    PROMPT+='%{$fg_bold[blue]%}%(5~|%-1~/…/%3~|%4~)%{$reset_color%} ' # cwd
    PROMPT+='$(git_prompt_info)' # Git status
    if [[ $UID == 0 || $EUID == 0 ]]; then
        PROMPT+='%{$fg[red]%}# %{$reset_color%}'
    else
        PROMPT+='%{$fg[white]%}$ %{$reset_color%}'
    fi
    unset -f __zsh_prompt
}
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"
__zsh_prompt
