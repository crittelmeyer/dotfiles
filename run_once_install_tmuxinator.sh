#!/bin/bash

echo "🚀 Installing tmuxinator..."

# Ensure we're using Homebrew's Ruby
if [[ -f "/opt/homebrew/opt/ruby/bin/ruby" ]]; then
    RUBY_PATH="/opt/homebrew/opt/ruby/bin"
elif [[ -f "/usr/local/opt/ruby/bin/ruby" ]]; then
    RUBY_PATH="/usr/local/opt/ruby/bin"
else
    echo "❌ Homebrew Ruby not found. Please install Ruby via Homebrew first."
    exit 1
fi

# Add Ruby to PATH for this script
export PATH="$RUBY_PATH:$PATH"

# Check if tmuxinator is already installed
if command -v tmuxinator &> /dev/null; then
    echo "✅ tmuxinator is already installed"
    exit 0
fi

# Install tmuxinator
echo "📦 Installing tmuxinator gem..."
"$RUBY_PATH/gem" install tmuxinator

# Create tmuxinator config directory if it doesn't exist
mkdir -p ~/.config/tmuxinator

echo "✅ tmuxinator installation complete!"
echo "💡 Run 'mux' or 'tmuxinator' to use it"