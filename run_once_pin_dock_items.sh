#!/bin/bash

set -e

echo "🧼 Cleaning up default macOS Dock..."

# Remove all apps except Finder and Notes
dockutil --remove all --no-restart
dockutil --add "/System/Applications/Notes.app" --no-restart

# Apps you want pinned (excluding auto-launchers like NordVPN or Tailscale)
apps_to_pin=(
  "Visual Studio Code"
  "Notion"
  "Linear"
  "Obsidian"
  "DBeaver"
  "Postman"
  "Figma"
  "zoom.us"
)

echo "📌 Pinning selected apps to Dock..."
for app in "${apps_to_pin[@]}"; do
  app_path="/Applications/${app}.app"
  if [ -d "$app_path" ]; then
    echo "→ Pinning $app"
    dockutil --add "$app_path" --no-restart
  else
    echo "⚠️  $app not found, skipping"
  fi
done

# Restart Dock to reflect changes
killall Dock

echo "✅ Dock cleanup and pinning complete."

