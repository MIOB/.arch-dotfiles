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

#################
# i3status-rust #
#################
rm -rf "${XDG_CONFIG_HOME}/i3status-rust"
ln -sf "${DOTFILES}/i3status-rust" "${XDG_CONFIG_HOME}/"

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

############
# zsh-abbr #
############
rm -rf "${XDG_CONFIG_HOME}/zsh-abbr"
ln -sf "${DOTFILES}/zsh-abbr" "${XDG_CONFIG_HOME}"

#############
# alacritty #
#############
rm -rf "${XDG_CONFIG_HOME}/alacritty"
ln -sf "${DOTFILES}/alacritty" "${XDG_CONFIG_HOME}"

#########
# dunst #
#########
mkdir -p "${XDG_CONFIG_HOME}/dunst"
ln -sf "${DOTFILES}/dunst/dunstrc" "${XDG_CONFIG_HOME}/dunst/"

##########
# ranger #
##########
mkdir -p "${XDG_CONFIG_HOME}/ranger"
ln -sf "${DOTFILES}/ranger/"* "${XDG_CONFIG_HOME}/ranger"

########
# nvim #
########
mkdir -p "${XDG_CONFIG_HOME}/nvim"
mkdir -p "${XDG_DATA_HOME}/nvim/undo"
ln -sf "${DOTFILES}/nvim/init.vim" "${XDG_CONFIG_HOME}/nvim"

if [[ ! -f "${XDG_CONFIG_HOME}/nvim/autoload/plug.vim" ]]; then
  curl --fail --location --silent --show-error --create-dirs \
    --output "${XDG_CONFIG_HOME}/nvim/autoload/plug.vim" \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi
nvim --noplugin +PlugUpdate +qa

#######
# gpg #
#######
rm -f "${HOME}/.gnupg/gpg-agent.conf"
mkdir -p "${HOME}/.gnupg"
ln -sf "${DOTFILES}/gnupg/scripts" "${HOME}/.gnupg/"
ln -sf "${DOTFILES}/gnupg/gpg-agent.conf" "${HOME}/.gnupg/"

#######
# git #
#######
mkdir -p "${XDG_CONFIG_HOME}/git"
ln -f "${DOTFILES}/git/config" "${XDG_CONFIG_HOME}/git"

#############
# autorandr #
#############
rm -rf "${XDG_CONFIG_HOME}/autorandr"
ln -sf "${DOTFILES}/autorandr" "${XDG_CONFIG_HOME}"

############
# keyboard #
############
localectl --no-convert set-x11-keymap eu,ru pc105 , grp:caps_toggle,grp_led:caps
