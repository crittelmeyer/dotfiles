#!/usr/bin/env bash
set -e

echo "🧠 Installing Claude Code CLI..."

# Ensure nvm is available
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
else
  echo "❌ nvm not found at $NVM_DIR/nvm.sh"
  exit 1
fi

# Install and use latest LTS version of Node.js
nvm install --lts
nvm use --lts

# Install Claude Code CLI globally
npm install -g @anthropic-ai/claude-code

echo "✅ Claude Code CLI installed."

