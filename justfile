# justfile for dotfiles project

# Default recipe when 'just' is run without arguments
default:
    @echo "Available commands:"
    @just --list

# Install dotfiles using dotbot
install:
    @echo "🔗 Installing dotfiles using Dotbot..."
    ./install

# Bootstrap a new machine
bootstrap:
    @echo "🚀 Bootstrapping new machine..."
    ./bootstrap.sh

# Safe installation for existing systems
install-safe:
    @echo "🛡️ Running safe installation..."
    ./install-safe.sh

# Install specific package categories
# Example: just install-packages modern_cli typescript
install-packages *categories:
    @echo "📦 Installing packages: $*"
    ./scripts/install-packages.sh $*

# Install optional packages
install-optional-packages:
    @echo "📦 Installing optional packages..."
    ./scripts/install-packages.sh --optional

# Run tests
test:
    @echo "🧪 Running dotfiles tests..."
    ./test/test-dotfiles.sh

# Run Docker tests
docker-test *args:
    @echo "🐳 Running Docker tests: $*"
    ./test-docker.sh $*

# Update all tools and dotfiles
update:
    @echo "🔄 Updating dotfiles and tools..."
    ./scripts/sync-settings.sh

# Create a backup of configurations
backup:
    @echo "🗂️ Creating backup of configurations..."
    ./scripts/backup-configs.sh

# Clean up test containers and images
docker-clean:
    @echo "🧹 Cleaning up Docker resources..."
    ./test-docker.sh clean

# Show help
help:
    @echo "Available commands:"
    @just --list
