
function () {
  autoload -Uz vcs_info
  precmd_functions+=(vcs_info)
  setopt prompt_subst

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' formats '%F{yellow}λ:%f%F{blue}%b%f'
  RPROMPT='$vcs_info_msg_0_'
  PROMPT='%F{white}%~%f $VI_PROMPT %B%(?.%F{blue}.%F{red})>%f%b '

}
