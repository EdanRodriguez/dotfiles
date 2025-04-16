#!/bin/bash

# === CONFIG ===
MAIN_BG_DURATION=4   # seconds for each main background
TRANSITION_FLASH_TIME=0.1
TRANSITION_DURATION=0.2

MAIN_BGS=("others/5.png" "others/1.png")
TRANSITION_BGS=("others/2.png" "others/3.png" "others/4.png")

# === FUNCTION: Flash transition images ===
transition_effect() {
  local end_time=$(( $(date +%s%N) + $(awk "BEGIN {printf \"%d\", $TRANSITION_DURATION * 1000000000}") ))
  while [ $(date +%s%N) -lt $end_time ]; do
    rand_img=${TRANSITION_BGS[$RANDOM % ${#TRANSITION_BGS[@]}]}
    feh --bg-fill "$rand_img"
    sleep $TRANSITION_FLASH_TIME
  done
}

# === MAIN LOOP ===
main_index=0
while true; do
  feh --bg-fill "${MAIN_BGS[$main_index]}"
  sleep $MAIN_BG_DURATION
  transition_effect
  main_index=$(( (main_index + 1) % ${#MAIN_BGS[@]} ))
done
# === END OF SCRIPT ===