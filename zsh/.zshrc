fpath=("${ZDOTDIR}/external" $fpath)

source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"

function () {
  local file
  for file in "${XDG_CONFIG_HOME}/zsh/configs/"*.zsh; do
    source "${file}"
  done
}

#############
# DIR STACK #
#############
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

##################
# COMMAND EDITOR #
##################
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#######
# FZF #
#######
if [[ $(command -v "fzf") ]]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

###########
# GIT GPG #
###########
export GPG_TTY="$(tty)"

#############
# AUTOSTART #
#############
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || exec startx "${XDG_CONFIG_HOME}/X11/.xinitrc"
fi
