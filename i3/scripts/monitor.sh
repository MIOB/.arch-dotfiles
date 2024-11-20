#!/usr/bin/env bash

function switch_monitor() {
  declare profile="${1:-default}"
  
  declare internal_display="eDP-1"
  declare -a home_displays=("DP-2" "DP-4")
  
  declare -a internal_display_mode=(--output "$internal_display" --mode 3840x2400 --rate 59.99)
  declare -a home_displays_mode=(--mode 3840x2160 --rate 60.00)

  declare -a arguments=()
  case "$profile" in
    default)
      arguments+=(
        "${internal_display_mode[@]}" --pos 0x0 --primary
      )
      for display in "${home_displays[@]}"; do
        arguments+=(--output "$display" --off)
      done
      ;;
    home)
      arguments+=(
        "${internal_display_mode[@]}" --below "${home_displays[0]}"
        --output "${home_displays[0]}" "${home_displays_mode[@]}" --pos 0x0
        --output "${home_displays[1]}" "${home_displays_mode[@]}" --right-of "${home_displays[0]}" --primary
      )
      ;;
    *)
      dunstify 'Display profile' "Unknow profile $profile" --urgency=low
      exit 1
      ;;
  esac 
  declare output
  if output=$(xrandr "${arguments[@]}" 2>&1); then
    dunstify 'Display profile' "Enabling profile $profile" --urgency=low
  else
    dunstify 'Display profile' "Cannot enable profile $profile:\n$output" --urgency=low
  fi
}

switch_monitor "$@"
