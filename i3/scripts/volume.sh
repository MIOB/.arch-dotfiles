#!/usr/bin/env bash
set -euo pipefail

function get_volume() {
  amixer sget Master | grep -o '[0-9]*%' | cut -d'%' -f1 | head -n 1
}

function is_mute() {
  amixer sget Master | grep '%' | grep off > /dev/null
}

case "$1" in
  up)
    if is_mute; then
      amixer sset Master toggle > /dev/null
    fi
    amixer sset Master 5%+ > /dev/null
    ;;
  down)
    if is_mute; then
      amixer sset Master toggle > /dev/null
    fi
    amixer sset Master 5%- > /dev/null
    ;;
  toggle)
    amixer sset Master toggle > /dev/null
    ;;
esac

if is_mute; then
  dunstify --appname=volume_notifier \
           --icon audio-volume-muted \
           " : Mute"
else
  readonly VOLUME=$(get_volume)
  dunstify --appname=volume_notifier \
           --hints int:value:"${VOLUME}" \
          " : ${VOLUME}%"
fi
