# justfile for dotfiles project

# Default recipe when 'just' is run without arguments
default:
    @echo "Available commands:"
    @just --list

# Build the TypeScript CLI
build:
    @echo "🔨 Building TypeScript CLI..."
    bun run build:local

# Build for all platforms
build-all:
    @echo "🔨 Building for all platforms..."
    bun run build

# Install dotfiles
install:
    @echo "🔗 Installing dotfiles..."
    bun run dev install

# Bootstrap a new machine
bootstrap:
    @echo "🚀 Bootstrapping new machine..."
    bun run dev bootstrap

# Safe installation for existing systems
install-safe:
    @echo "🛡️ Running safe installation..."
    bun run dev install --safe

# Install specific package categories
# Example: just install-packages modern_cli typescript
install-packages *categories:
    @echo "📦 Installing packages: $*"
    bun run dev packages $*

# Install optional packages
install-optional-packages:
    @echo "📦 Installing optional packages..."
    bun run dev packages --optional

# Preview package installation (dry run)
preview-packages *categories:
    @echo "👀 Previewing package installation: $*"
    bun run dev packages --dry-run $*

# Check dependencies
check-deps:
    @echo "🔍 Checking dependencies..."
    bun run dev check-deps

# Sync all tools and dotfiles
sync:
    @echo "🔄 Syncing dotfiles and tools..."
    bun run dev sync

# Create a backup of configurations
backup:
    @echo "🗂️ Creating backup of configurations..."
    bun run dev backup

# Run tests
test:
    @echo "🧪 Running dotfiles tests..."
    bun run dev test

# Development mode (run without compiling)
dev:
    @echo "💻 Running in development mode..."
    bun run dev

# Show help
help:
    @echo "Available commands:"
    @just --list
