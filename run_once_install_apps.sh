#!/bin/bash

set -e

machine_type=$(<~/.config/chezmoi-machine-type)

echo "🧠 Installing apps for system type: $machine_type"

# Apps used on all systems
common_apps=(
  visual-studio-code
  notion
  linear-linear
  obsidian
  docker
  dbeaver-community
  postman
  figma
  zoom
)

# Personal systems only
personal_apps=(
  tailscale
  discord
  nordvpn
  copilot
)

# Video editing/streaming systems only
video_apps=(
  streamlabs
  descript
  screen-studio
  screenbrush
  davinci-resolve
)

# Poker machines only
poker_apps=(
  poker-copilot
  pokercruncher
  blackchippoker
)

# Pentesting machines only
pentest_apps=(
  wireshark
)

# Combine app lists
apps=("${common_apps[@]}")

case "$machine_type" in
  personal)
    apps+=("${personal_apps[@]}")
    ;;
  video)
    apps+=("${video_apps[@]}")
    ;;
  poker)
    apps+=("${poker_apps[@]}")
    ;;
  pentest)
    apps+=("${pentest_apps[@]}")
    ;;
esac

# Install apps
for app in "${apps[@]}"; do
  app_name=$(echo "$app" | sed 's/-/ /g' | awk '{ for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2); print }' | tr '\n' ' ')
  app_path="/Applications/${app_name}.app"

  if brew list --cask "$app" &>/dev/null || [ -d "$app_path" ]; then
    echo "✅ $app already installed or present in /Applications."
  else
    echo "⬇️  Installing $app..."
    brew install --cask "$app"
  fi
done

echo "🎉 App installation complete."

