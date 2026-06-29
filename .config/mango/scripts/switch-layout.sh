mmsg dispatch switch_layout
layout="$(mmsg get monitor HDMI-A-1 2>/dev/null | jq -r '.layout_symbol // empty')"
notify-send \
  --urgency=low \
  --expire-time=1000 \
  --category=hlayout \
  "${layout}"
