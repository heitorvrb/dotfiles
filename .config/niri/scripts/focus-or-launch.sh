#!/usr/bin/env bash
# focus-or-launch.sh — focus existing window matching a field/regex, else spawn it.
#
# Usage: focus-or-launch.sh <field> <regex> -- <launch command...>
#   <field>  app_id | title
#   <regex>  case-insensitive regex matched against that field
#
# Examples:
#   focus-or-launch.sh app_id '^cursor$'        -- cursor --new-window
#   focus-or-launch.sh title  'notas.*Cursor'   -- cursor --new-window "$HOME/notas"
#   focus-or-launch.sh app_id '^org\.telegram'  -- telegram-desktop
#
# Notes:
#  - Focuses the MOST RECENTLY focused matching window when several match.
#  - niri spawns on the currently focused workspace, so a new window lands there.
set -euo pipefail

field=$1
regex=$2
shift 2
[ "${1:-}" = "--" ] && shift   # tolerate an explicit -- separator

id=$(niri msg -j windows | jq -r \
  --arg f "$field" --arg re "$regex" '
    map(select((.[$f] // "") | test($re; "i")))
    | sort_by(.focus_timestamp.secs)
    | last // {}
    | .id // empty')

if [ -n "$id" ]; then
  exec niri msg action focus-window --id "$id"
else
  exec niri msg action spawn -- "$@"
fi
