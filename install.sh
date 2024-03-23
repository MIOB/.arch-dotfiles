#!/usr/bin/env bash

set -euo pipefail

readonly DOTFILES="${DOTFILES:-${HOME}/.dotfiles}"
readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

#######
# X11 #
#######
rm -rf "${XDG_CONFIG_HOME}/X11"
ln -sf "${DOTFILES}/X11" "${XDG_CONFIG_HOME}"

######
# i3 #
######
rm -rf "${XDG_CONFIG_HOME}/i3"
ln -sf "${DOTFILES}/i3" "${XDG_CONFIG_HOME}"

############
# i3status #
############
rm -rf "${XDG_CONFIG_HOME}/i3status"
ln -sf "${DOTFILES}/i3status" "${XDG_CONFIG_HOME}/"

