# 🚀 Portable Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Ubuntu-blue)](https://github.com/alexalexandrescu/dotfiles)

**⚠️ DISCLAIMER: This is a public repository. Use at your own risk. Always review code before running on your system. Backup your existing configurations before installation.**

A minimal, portable dotfiles configuration that works seamlessly across macOS and Ubuntu environments. Built with TypeScript + Bun for a fast, self-contained CLI tool with no runtime dependencies.

**✨ Key Features:**
- 🎯 **Truly Portable** - No hardcoded paths, works across different usernames and systems
- ⚡ **Modern CLI Tools** - Enhanced productivity without breaking system commands
- 🎨 **Starship Prompt** - Fast, informative, cross-shell prompt
- 🔧 **Smart Detection** - Automatically adapts to your environment
- 📦 **Zero Dependencies** - Single executable, no runtime requirements

## 📋 Table of Contents

- [Quick Installation](#-quick-installation)
- [What's Included](#-whats-included)
- [Portability Features](#-portability-features)
- [CLI Commands](#-cli-commands)
- [Tool Usage Guide](#-tool-usage-guide)
- [Maintenance](#-maintenance)

## 🚀 Quick Installation

### 🌟 Zero-Config Setup (New Machine)

**No Git required!** Just download and run:

```bash
curl -L https://github.com/alexalexandrescu/dotfiles/releases/latest/download/install.sh | bash
./dotfiles bootstrap
```

This will:
- Detect your platform (macOS/Linux, Intel/ARM)
- Download the correct executable
- Set up your complete development environment

### 🛠️ Development Setup

For development or if you have Git configured:

```bash
git clone https://github.com/alexalexandrescu/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install dependencies
bun install

# Build executable
bun run build:local

# Run commands
./dist/dotfiles bootstrap
```

## 📦 What's Included

### Core Development Tools
- **Git** - Version control with sensible defaults
- **NVM** - Node Version Manager for JavaScript projects
- **Bun** - Fast JavaScript runtime and toolkit
- **Docker** - Container development

### Modern CLI Tools (Safe Alternatives)
These tools enhance your workflow WITHOUT breaking system commands:

- **ripgrep (rg)** - Fast text search → use `search <pattern>`
- **fd** - Fast file finder → use `ff <pattern>`
- **bat** - Syntax-highlighted cat → use `bcat`
- **eza** - Modern ls with icons → use `ll`, `lt`
- **fzf** - Fuzzy finder → `Ctrl+R` for history, `fo` to open files
- **zoxide** - Smart cd → `z <dir>` learns your habits
- **Starship** - Fast, minimal prompt with Git status
- **direnv** - Auto-load environment variables per directory

### Productivity Tools
- **tmux** - Terminal multiplexer with vim bindings
- **micro** - Modern terminal editor (easier than vim)
- **lazygit** - Beautiful Git TUI
- **gh** - GitHub CLI

### Shell Enhancements

**Smart Functions:**
```bash
smart-install express          # Auto-detect package manager (bun/pnpm/npm)
project-health                 # Check dependencies, security, TypeScript
quick-commit feat "message"    # Conventional commits helper
dev                            # Smart dev server detection
npm-fresh / bun-fresh          # Clean reinstall
p <project-name>               # Quick jump to ~/Projects
load-env                       # Load .env file into environment
```

**Git Shortcuts:**
```bash
gs    # git status
ga    # git add
gc    # git commit (opens template)
gp    # git push
gl    # git log --oneline -10
gd    # git diff
```

**Useful Aliases:**
```bash
ll    # Detailed file list with icons (eza)
lt    # Tree view (eza)
..    # cd ..
...   # cd ../..
```

## 🌍 Portability Features

### No Hardcoded Paths
- All paths use `~` for home directory
- Works with any username
- Platform detection for OS-specific behavior

### Cross-Platform Clipboard
- macOS: Uses `pbcopy`/`pbpaste`
- Linux: Falls back to `xclip` or `xsel`
- Tmux copy-mode works everywhere

### Smart Environment Detection
```bash
is_container    # Detect if running in Docker
is_wsl          # Detect Windows Subsystem for Linux
is_ssh          # Detect SSH session
is_vm           # Detect virtual machine
get_os          # Returns "macos" or "linux"
```

### Platform-Specific Configs
- `macos/.zshrc.local` - Homebrew, macOS-specific aliases
- `ubuntu/.zshrc.local` - APT, Ubuntu-specific aliases
- Automatically loaded based on detected OS

### Consistent Coding Standards
- **`.editorconfig`** - Consistent formatting across all editors
- **`.inputrc`** - Better command-line editing (readline)
- **`.gitmessage`** - Conventional commit template

## 🏗️ Architecture

Built with modern TypeScript:

```
src/
├── cli.ts                 # Main entry point
├── config/                # Configuration system with Zod validation
├── commands/              # All CLI commands
│   ├── bootstrap.ts      # Full environment setup
│   ├── install.ts        # Safe installation
│   ├── packages.ts       # Package management
│   └── sync.ts           # Update all tools
├── core/                  # Core functionality
│   ├── dependencies.ts   # Dependency checking
│   ├── package-manager.ts # Package installation
│   ├── platform.ts       # OS detection
│   └── symlinks.ts       # Smart symlink management
└── utils/                 # Utilities

config.json               # Single source of truth (validated with Zod)
```

### Smart Symlink Management
- Won't overwrite application-managed configs
- Skips recently modified files
- Protects `.config/` directories
- Clear warnings for skipped files

## 📋 CLI Commands

```bash
# Full environment setup (new machines)
dotfiles bootstrap

# Install dotfiles (existing systems)
dotfiles install [--safe]

# Install packages from categories
dotfiles packages [categories] [--dry-run]

# Update all tools
dotfiles sync

# Backup existing configs
dotfiles backup

# Run test suite
dotfiles test

# Check dependencies
dotfiles check-deps

# Show help
dotfiles --help
```

## 🛠️ Installation Options

### Complete Bootstrap
Sets up everything from scratch:
```bash
./dotfiles bootstrap
```

### Safe Installation
Interactive mode preserving existing configs:
```bash
./dotfiles install --safe
```

### Package-Only Installation
Install modern CLI tools without configs:
```bash
./dotfiles packages modern_cli productivity
```

### Preview Installation
See what would be installed:
```bash
./dotfiles packages --dry-run modern_cli
```

## 🔧 Maintenance

### Update Dotfiles
```bash
cd ~/dotfiles
git pull
./dotfiles sync
```

### Backup Configurations
```bash
./dotfiles backup
```

### Run Tests
```bash
./dotfiles test
```

## 🎨 Customization

### Starship Prompt
Edit `~/.config/starship.toml` to customize your prompt:
```bash
micro ~/.config/starship.toml
```

### Git Configuration
Edit `~/.gitconfig` to add your name/email:
```bash
micro ~/.gitconfig
```

### Platform-Specific Aliases
Add custom aliases to:
- macOS: `macos/.zshrc.local`
- Ubuntu: `ubuntu/.zshrc.local`

## 🚨 Troubleshooting

### "Permission denied"
```bash
chmod +x dotfiles
```

### "Config not found"
Make sure you're in the directory containing `config.json`.

### "Wrong architecture"
Download the correct executable for your platform from [Releases](https://github.com/alexalexandrescu/dotfiles/releases/latest).

### Dependency Issues
```bash
./dotfiles check-deps          # Check what's missing
```

## 📚 Additional Resources

- [INSTALL.md](INSTALL.md) - Detailed installation guide
- [QUICK-START.md](QUICK-START.md) - Quick start for new computers
- [BUILD.md](BUILD.md) - Build instructions
- [CLAUDE.md](CLAUDE.md) - Architecture details for Claude Code

## 🔧 Building from Source

```bash
# Install dependencies
bun install

# Build for local platform
bun run build:local

# Build for all platforms
bun run build

# Run in development
bun run dev

# Type check
bun run typecheck
```

## 📝 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

Built with inspiration from the amazing developer tool community:
- [Starship](https://starship.rs/) - Fast, minimal prompt
- [Modern Unix](https://github.com/ibraheemdev/modern-unix) - Modern CLI tools
- [Dotfiles community](https://dotfiles.github.io/) - Best practices
