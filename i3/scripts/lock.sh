#!/bin/bash

set -euo pipefail

readonly LOCK_IMAGE=/tmp/i3lock.png

scrot -o "${LOCK_IMAGE}"
convert "${LOCK_IMAGE}" -scale 10% -scale 1000% "${LOCK_IMAGE}"

i3lock -u -i "${LOCK_IMAGE}"
