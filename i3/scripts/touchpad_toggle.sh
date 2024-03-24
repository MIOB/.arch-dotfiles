#!/usr/bin/env bash
set -euo pipefail

readonly _DEVICE_NAME='VEN_04F3:00 04F3:311C Touchpad'
if xinput list-props "${_DEVICE_NAME}" | grep 'Device Enabled' |
  cut -d':' -f2 | grep 1 
then
  xinput disable "${_DEVICE_NAME}"
  dunstify 'Touchpad' 'Disabled' --appname=touchpad_notifier
else
  xinput enable "${_DEVICE_NAME}"
  dunstify 'Touchpad' 'Enabled' --appname=touchpad_notifier
fi
