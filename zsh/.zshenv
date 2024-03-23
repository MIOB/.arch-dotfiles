
#######
# XDG #
#######

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

##########
# EDITOR #
##########

export EDITOR="nvim"
export VISUAL="nvim"

#######
# ZSH #
#######

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

###############
# ZSH HISTORY #
###############

export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

#########
# OTHER #
#########

export DOTFILES="${HOME}/.dotfiles"

