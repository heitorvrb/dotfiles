#!/usr/bin/env bash
# tag-view.sh — switch to a mango tag; if that tag is empty, launch its
# default program. Bound to SUPER+<n> in config.conf.
#
# Usage: tag-view.sh <tag-number 1-9>
set -euo pipefail

tag="${1:?usage: tag-view.sh <tag-number 1-9>}"
home="${HOME:-/home/heitor}"

# Default program for each tag. TUI apps run inside foot.
case "$tag" in
  #1) default=(footclient --working-directory "$home" -e env NVIM_APPNAME=hvim nvim) ;; # hvim in home
  1) default=(footclient) ;;
  2) default=(footclient) ;;
  3) default=(/opt/helium-browser-bin/helium) ;;                                      # helium browser
  4) default=(dbeaver) ;;
  5) default=(footclient -e lazygit) ;;
  6) default=(vscodium) ;;
  7) default=(zapzap) ;;
  8) default=(Telegram) ;;
  9) default=(discord) ;;
  *) default=() ;;
esac

# Figure out the focused monitor *before* switching, so an empty target tag
# (which leaves nothing focused) doesn't lose the reference.
monitor="$(mmsg get focusing-client 2>/dev/null | jq -r '.monitor // empty')"
if [ -z "$monitor" ]; then
  monitor="$(mmsg get all-monitors | jq -r 'first(.monitors[] | select(.active==true) | .name)')"
fi

# 1. View (switch) to the tag.
mmsg dispatch view,"$tag",0

# 2. Count the windows currently on that tag of the focused monitor.
count="$(mmsg get all-monitors | jq -r --arg m "$monitor" --argjson t "$tag" \
  '.monitors[] | select(.name==$m) | .tags[] | select(.index==$t) | .client_count')"

# 3. If the tag is empty, let the compositor launch its default program. Using
#    mango's own spawn (same path as keybind `spawn,...`) means it handles the
#    fork/detach/session exactly like every other app it launches.
if [ "${count:-0}" -eq 0 ] && [ "${#default[@]}" -gt 0 ]; then
  mmsg dispatch "spawn,${default[*]}"
fi
