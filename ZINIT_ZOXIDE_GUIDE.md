# Zinit & Zoxide Usage Guide

## Zinit - Zsh Plugin Manager

Zinit is a flexible and fast Zsh plugin manager that I've configured in your `.zshrc`. Here's how to use it:

### Basic Commands

```bash
# Update zinit itself
zinit self-update

# Update all plugins
zinit update --all

# Update a specific plugin
zinit update zsh-users/zsh-autosuggestions

# List loaded plugins
zinit list

# View plugin report
zinit report zsh-users/zsh-syntax-highlighting

# Delete a plugin
zinit delete zsh-users/some-plugin

# Clean up removed plugins
zinit cclear
```

### Adding New Plugins

To add a new plugin, edit your `.zshrc` and add after the existing plugin lines:

```bash
# Light loading (fast, most common)
zinit light username/plugin-name

# Normal loading (with reporting)
zinit load username/plugin-name

# For Oh-My-Zsh plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/docker/docker.plugin.zsh

# For Prezto modules
zinit snippet PZT::modules/helper/init.zsh
```

### Currently Installed Plugins

1. **zsh-autosuggestions** - Fish-like autosuggestions
   - Type to see suggestions from history
   - Press `→` or `End` to accept suggestion
   - Press `Ctrl+→` to accept one word

2. **zsh-syntax-highlighting** - Fish-like syntax highlighting
   - Commands are highlighted as you type
   - Green = valid command
   - Red = command not found

3. **zsh-completions** - Additional completion definitions
   
4. **zsh-history-substring-search** - Search history by substring
   - Type part of a command and press `↑`/`↓` to search

## Zoxide - Smarter cd

Zoxide learns your most used directories and lets you jump to them quickly.

### Basic Usage

```bash
# Use 'z' instead of 'cd' - it learns your habits
z dotfiles        # Jump to ~/Repos/dotfiles (after visiting it once)
z dot            # Fuzzy matching - jumps to dotfiles if it's the best match

# Interactive selection with 'zi'
zi               # Shows all directories in database
zi dot           # Shows directories matching 'dot'

# Query the database
zoxide query dot      # Show best match for 'dot'
zoxide query -l dot   # List all matches for 'dot'
zoxide query -s       # Show statistics

# Add current directory to database
zoxide add .

# Remove directory from database
zoxide remove /path/to/dir
```

### Examples

```bash
# First time - use full path
cd ~/Repos/dotfiles

# Next time - just use z
z dotfiles

# Or even shorter if unique
z dot

# Jump between multiple repos
z dotfiles_old
z dotfiles

# Use zi for interactive selection when unsure
zi repos
```

### Tips

1. **Building the database**: Zoxide learns as you use `cd`. The more you navigate, the smarter it gets.

2. **Partial matching**: You don't need the full name:
   ```bash
   z proj    # Could jump to ~/Documents/projects
   z down    # Could jump to ~/Downloads
   ```

3. **Multiple keywords**: Use space-separated keywords:
   ```bash
   z repos dot   # Matches ~/Repos/dotfiles
   ```

4. **Recent directories have higher weight**: Frequently and recently accessed directories rank higher.

## Troubleshooting

### Zinit Issues

```bash
# If plugins aren't loading, try:
zinit cclear           # Clear compiled files
rm -rf ~/.zinit        # Complete reinstall
# Then restart your shell

# Check zinit installation
zinit --version
```

### Zoxide Issues

```bash
# Check if zoxide is properly initialized
which z
which zi

# Manually initialize if needed
eval "$(zoxide init zsh)"

# Check database
zoxide query -s
```

## Customization

### Autosuggestion Colors

Add to your `.zshrc`:

```bash
# Make suggestions more visible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,underline"
```

### Key Bindings

Already configured in your `.zshrc`:
- `↑`/`↓` - History substring search
- `→` - Accept autosuggestion
- `Ctrl+→` - Accept one word of suggestion

### Performance

If shell startup is slow:

```bash
# Profile zinit loading times
zinit times

# Use light loading for plugins
zinit light user/plugin  # Instead of 'load'

# Lazy load plugins
zinit ice wait"0" lucid
zinit light some/plugin
```