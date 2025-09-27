#!/bin/bash

# Cross-platform package installer
# Reads from packages.sh and installs based on current OS

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
PACKAGES_SH_FILE="$DOTFILES_DIR/scripts/packages.sh"

# Source the packages definitions
if [[ -f "$PACKAGES_SH_FILE" ]]; then
    source "$PACKAGES_SH_FILE"
else
    echo "❌ Error: packages.sh not found at $PACKAGES_SH_FILE"
    exit 1
fi

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux"* ]]; then
    OS="ubuntu"
fi

echo "🖥️  Detected OS: $OS"

# Function to install packages for current OS
install_category() {
    local category_name="$1"
    local install_optional="${2:-false}"

    echo ""
    echo "📦 Installing $category_name packages..."

    # Get the associative array name from the CATEGORY_MAP
    local -n category_array="${CATEGORY_MAP[$category_name]}"

    if [[ -z "${category_array[*]}" ]]; then
        echo "❌ Error: No packages defined for category '$category_name'."
        return 1
    fi

    for pkg_key in "${!category_array[@]}"; do
        local pkg_info="${category_array[$pkg_key]}"
        IFS=';' read -r name package_macos package_ubuntu global_npm optional <<< "$pkg_info"

        # Skip optional packages unless requested
        if [[ "$optional" == "true" && "$install_optional" != "true" ]]; then
            echo "  ⏭️  Skipping optional package: $name"
            continue
        fi

        echo "  📥 Installing: $name"

        # Install via package manager
        if [[ "$OS" == "macos" && "$package_macos" != "null" ]]; then
            if ! brew list "$package_macos" &>/dev/null; then
                brew install "$package_macos"
            else
                echo "    ✅ Already installed: $package_macos"
            fi
        elif [[ "$OS" == "ubuntu" && "$package_ubuntu" != "null" ]]; then
            if ! dpkg -l | grep -q "^ii  $package_ubuntu " &>/dev/null; then
                sudo apt install -y "$package_ubuntu"
            else
                echo "    ✅ Already installed: $package_ubuntu"
            fi
        fi

        # Install global npm package
        if [[ "$global_npm" != "null" && "$global_npm" != "false" ]]; then
            if ! npm list -g "$global_npm" &>/dev/null; then
                npm install -g "$global_npm"
            else
                echo "    ✅ Already installed globally: $global_npm"
            fi
        fi
    done
}

# Main installation
echo "🚀 Cross-platform package installation"

# Parse command line arguments
INSTALL_OPTIONAL=false
CATEGORIES=()

while [[ $# -gt 0 ]]; do
    case $1 in
        --optional)
            INSTALL_OPTIONAL=true
            shift
            ;;
        *)
            CATEGORIES+=("$1")
            shift
            ;;
    esac
done

# If no categories specified, install default ones
if [[ ${#CATEGORIES[@]} -eq 0 ]]; then
    CATEGORIES=("development" "typescript" "modern_cli" "developer_tools" "docker" "productivity")
fi

# Install each category
for category in "${CATEGORIES[@]}"; do
    if [[ -n "${CATEGORY_MAP[$category]}" ]]; then
        install_category "$category" "$INSTALL_OPTIONAL"
    else
        echo "❌ Unknown category: $category"
    fi
done

echo ""
echo "✅ Package installation complete!"
echo ""
echo "💡 Usage examples:"
echo "  $0                           # Install default categories"
echo "  $0 --optional              # Install including optional packages"
echo "  $0 typescript              # Install only TypeScript tools"
echo "  $0 development modern_cli  # Install specific categories"
