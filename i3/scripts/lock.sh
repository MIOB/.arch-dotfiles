#!/bin/bash

set -euo pipefail

readonly LOCK_IMAGE=/tmp/i3lock.png

scrot -o "${LOCK_IMAGE}"
convert "${LOCK_IMAGE}" -scale 5% -scale 2000% "${LOCK_IMAGE}"

i3lock --image="${LOCK_IMAGE}" --ignore-empty-password --show-failed-attempts --show-keyboard-layout --nofork

