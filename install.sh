#!/usr/bin/env bash

set -euo pipefail

readonly DOTFILES="${DOTFILES:-${HOME}/.dotfiles}"
readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
readonly XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
readonly XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"

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

#######
# zsh #
#######
mkdir -p "${XDG_CONFIG_HOME}/zsh" "${XDG_STATE_HOME}/zsh"
ln -sf "${DOTFILES}/zsh/.zshenv" "${HOME}"
ln -sf "${DOTFILES}/zsh/.zshrc" "${XDG_CONFIG_HOME}/zsh"
ln -sf "${DOTFILES}/zsh/aliases.zsh" "${XDG_CONFIG_HOME}/zsh"
rm -rf "${XDG_CONFIG_HOME}/zsh/external"
ln -sf "${DOTFILES}/zsh/external" "${XDG_CONFIG_HOME}/zsh"
rm -rf "${XDG_CONFIG_HOME}/zsh/scripts"
ln -sf "${DOTFILES}/zsh/scripts" "${XDG_CONFIG_HOME}/zsh"
rm -rf "${XDG_CONFIG_HOME}/zsh/configs"
ln -sf "${DOTFILES}/zsh/configs" "${XDG_CONFIG_HOME}/zsh"
