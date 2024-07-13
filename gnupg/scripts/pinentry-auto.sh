#!/usr/bin/env bash
case "${PINENTRY_USER_DATA:-}" in
curses)
  exec pinentry-curses "$@"
  ;;
*)
  exec pinentry-gtk "$@"
  ;;
esac
