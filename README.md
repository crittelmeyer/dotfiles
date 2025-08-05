# Chris's Dotfiles

Modern dotfiles managed with [chezmoi](https://www.chezmoi.io/), featuring:
- 🚀 Zsh with zinit plugin manager 
- ⭐ Starship prompt (replacing powerline)
- 🧠 Smart directory navigation with zoxide
- 🎨 Syntax highlighting and autosuggestions
- 🍺 Homebrew package management
- 🖥️ Machine-specific configurations

## Quick Start

### Prerequisites

1. **Download and install [Google Chrome](https://www.google.com/chrome/)**
2. **Download and install [iTerm2](https://iterm2.com/)**
3. **Open iTerm2** and run: `xcode-select --install`

### Installation

From iTerm2, run this one command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply crittelmeyer
```

This will:
1. Install chezmoi
2. Clone this repository
3. Ask for your system type (personal/work/video/poker/pentest)
4. Install Homebrew if not present
5. Install all packages from Brewfile
6. Install tmuxinator Ruby gem
7. Configure zsh with zinit and plugins
8. Set up all dotfiles and configurations
9. Install fonts (Hack Nerd Font for iTerm2)

### What Gets Installed

- **Shell**: Zsh with zinit, starship prompt, syntax highlighting
- **Dev Tools**: Git, Node.js, Python, Poetry, Ruby, Docker
- **CLI Tools**: tmux, vim, fzf, ripgrep, bat, zoxide, tmuxinator
- **Apps**: VS Code, Notion, Linear, and more based on system type
- **Fonts**: Hack Nerd Font for terminal

## What's Included

### Shell Environment

- **Zsh Configuration** (`dot_zshrc`)
  - Zinit plugin manager with auto-installation
  - Fish-like autosuggestions and syntax highlighting
  - Smart history search
  - Git aliases (similar to oh-my-zsh)
  - FZF integration for fuzzy finding
  - Zoxide for smart directory jumping

- **Starship Prompt** (`dot_config/starship.toml`)
  - Git status integration
  - Language version indicators
  - Command duration
  - Custom two-line prompt layout

### Development Tools

- **Git** - Version control with useful aliases
- **Node.js** - JavaScript runtime
- **Python** - Latest Python 3
- **Poetry** - Modern Python dependency management
- **Ruby** - For gems like tmuxinator
- **Rust** - Via cargo (for tools like ripgrep, fd, etc.)
- **Docker** - Containerization

### Terminal Tools

- **tmux** - Terminal multiplexer with custom config
- **vim** - Text editor with plugins
- **fzf** - Fuzzy finder
- **ripgrep** - Fast search tool
- **fd** - Modern find replacement
- **bat** - Better cat with syntax highlighting
- **zoxide** - Smarter cd command

### Applications (via Homebrew Cask)

Based on your system type selection:

**Common Apps** (all systems):
- Visual Studio Code
- Notion
- Linear
- Obsidian
- Docker Desktop
- DBeaver
- Postman
- Figma
- Zoom

**Personal Systems**:
- Tailscale
- Discord
- NordVPN
- GitHub Copilot

**Video/Streaming Systems**:
- Streamlabs
- Descript
- Screen Studio
- ScreenBrush
- DaVinci Resolve

**Poker Systems**:
- Poker Copilot
- PokerCruncher
- Black Chip Poker

**Pentest Systems**:
- Wireshark

## Key Features

### Zsh Plugins (via zinit)

- `zsh-autosuggestions` - Suggests commands as you type
- `zsh-syntax-highlighting` - Highlights commands in real-time
- `zsh-completions` - Additional completion definitions
- `zsh-history-substring-search` - Search history by partial match

### Useful Aliases

```bash
# Git shortcuts
g      # git
gst    # git status
ga     # git add
gaa    # git add --all
gc     # git commit -v
gco    # git checkout
gd     # git diff
glog   # git log --oneline --decorate --graph
gs     # git show
gcx    # git commit --fixup
grbiq  # git rebase -i --autosquash

# Directory navigation
cd     # Smart cd (uses zoxide for partial matches, pushd for paths)
z      # Pure zoxide jump
zi     # Interactive directory selection
po     # popd - go back in directory history
d      # Show directory stack
1-9    # Jump to directory history (cd -1, cd -2, etc)
md     # mkdir -p (create with parents)

# File listing
l      # ls -lah (detailed list with human sizes)
ll     # ls -alF
la     # ls -A

# Tmux/Tmuxinator
tl     # List tmux sessions
ts     # Create new tmux session
ta     # Attach to tmux session
tkss   # Kill tmux session
mux    # tmuxinator

# System utilities
ip     # Show public IP
localip # Show local IP
show/hide # Toggle hidden files in Finder
afk    # Lock screen
```

## Customization

### Adding Zsh Plugins

Edit `~/.zshrc` and add after existing plugins:

```bash
zinit light username/plugin-name
```

### Customizing Starship Prompt

Edit `~/.config/starship.toml`. See [starship.rs](https://starship.rs/config/) for options.

### Machine-Specific Settings

The setup asks for your machine type which determines:
- Which applications to install
- Environment-specific configurations

To change later: 
```bash
echo "personal" > ~/.config/chezmoi-machine-type  # or work/video/poker/pentest
chezmoi apply
```

## Keyboard Shortcuts

### Zsh
- `→` or `End` - Accept autosuggestion
- `Ctrl+→` - Accept one word of suggestion
- `↑`/`↓` - Search history by substring
- `Ctrl+R` - Fuzzy history search (via fzf)
- `Ctrl+T` - Fuzzy file finder
- `Alt+C` - Fuzzy directory changer

### tmux
See `dot_tmux.conf` for full bindings. Highlights:
- `Ctrl+q` - Prefix key (instead of default `Ctrl+b`)
- `Prefix + |` - Split pane vertically
- `Prefix + -` - Split pane horizontally
- `Prefix + r` - Reload config
- `Prefix + d` or `Prefix + Ctrl+z` - Detach from session

## Updating

```bash
# Update dotfiles from repo
chezmoi update

# Update all Homebrew packages
brew update && brew upgrade

# Update Zsh plugins
zinit update --all

# Update zinit itself
zinit self-update
```

## Troubleshooting

### Zsh plugins not loading

```bash
zinit cclear  # Clear compiled files
rm -rf ~/.local/share/zinit  # Full reinstall
exec zsh  # Restart shell
```

### Homebrew issues on Apple Silicon

Ensure Homebrew is in your PATH:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Slow shell startup

```bash
# Profile startup time
zinit times

# Consider lazy-loading heavy plugins in .zshrc
```

## Additional Guides

- [Zinit & Zoxide Usage Guide](ZINIT_ZOXIDE_GUIDE.md) - Detailed usage instructions

## Migration from oh-my-zsh

This setup replaces oh-my-zsh with a faster, more minimal approach:
- Zinit instead of oh-my-zsh framework
- Starship instead of powerline
- Only essential plugins (autosuggestions, syntax highlighting)
- Kept familiar git aliases

## License

Feel free to use and modify as needed!