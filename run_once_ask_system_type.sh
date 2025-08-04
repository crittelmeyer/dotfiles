#!/bin/bash

echo ""
echo "🧠 Choose your system type:"
echo "1) Personal (default)"
echo "2) Work"
echo "3) Video Editing / Streaming"
echo "4) Poker"
echo "5) Pentest"

read -p "Enter a number (1-5): " type

case "$type" in
  2) system_type="work" ;;
  3) system_type="video" ;;
  4) system_type="poker" ;;
  5) system_type="pentest" ;;
  *) system_type="personal" ;;
esac

echo "💾 Saving system type as: $system_type"

echo "$system_type" > ~/.config/chezmoi-machine-type

