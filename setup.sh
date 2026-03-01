#!/bin/bash
# Bootstrap script for a new macOS machine.
# Run: bash setup.sh

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "=== dotfiles setup ==="

bash "$DOTFILES/scripts/whatsapp-folder-action/install.sh"

echo "=== Done ==="
