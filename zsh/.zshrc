fpath=("${ZDOTDIR}/external" $fpath)

source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"

function () {
  local file
  for file in "${XDG_CONFIG_HOME}/zsh/configs/"*.zsh; do
    source "${file}"
  done
}

#######################
# SYNTAX HIGHLIGHTING #
#######################
function () {
  local script='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
  if [[ -f "${script}" ]]; then
    source "${script}"
  fi
}

###################
# AUTOSUGGESTIONS #
###################
function() {
  local script="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  if [[ -f "${script}" ]]; then
    source "${script}"
  fi
}

########
# ABBR #
########
function() {
  local script='/usr/share/zsh/plugins/zsh-abbr/zsh-abbr.zsh'
  if [[ -f "${script}" ]]; then
    source "${script}"
  fi
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

##########
# ZOXIDE #
##########
if [[ $(command -v "zoxide") ]]; then
  eval "$(zoxide init zsh)"
fi

###########
# GIT GPG #
###########
if [[ -t 0 ]]; then
  export GPG_TTY="$(tty)"
  if [[ "$(tty)" != "/dev/tty1" ]]; then
    export PINENTRY_USER_DATA='curses'
  fi
fi

#############
# AUTOSTART #
#############
if [[ "$(tty)" = "/dev/tty1" ]]; then
  source /usr/share/nvm/init-nvm.sh
  pgrep i3 || exec startx "${XDG_CONFIG_HOME}/X11/.xinitrc"
fi

