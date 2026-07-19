#!/usr/bin/env bash
# any — installer. Downloads the standalone `any` binary (no Node.js required)
# and puts it on your PATH. Same idea as Claude Code's own installer.
#
#   curl -fsSL https://raw.githubusercontent.com/kamal0808/homebrew-any/main/install.sh | bash
set -euo pipefail

REPO="kamal0808/homebrew-any"
VERSION="v0.4.0"
INSTALL_DIR="$HOME/.local/bin"

os="$(uname -s)"
arch="$(uname -m)"

if [ "$os" != "Darwin" ]; then
  echo "error: this installer currently supports macOS only." >&2
  exit 1
fi

case "$arch" in
  arm64) asset="any-darwin-arm64.tar.gz" ;;
  x86_64) asset="any-darwin-x64.tar.gz" ;;
  *)
    echo "error: unsupported architecture: $arch" >&2
    exit 1
    ;;
esac

url="https://github.com/${REPO}/releases/download/${VERSION}/${asset}"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "Downloading any (${VERSION}, ${arch})…"
curl -fsSL "$url" -o "$tmp/any.tar.gz"
tar -xzf "$tmp/any.tar.gz" -C "$tmp"

mkdir -p "$INSTALL_DIR"
mv "$tmp"/any-darwin-* "$INSTALL_DIR/any"
chmod +x "$INSTALL_DIR/any"

echo "✓ installed to $INSTALL_DIR/any"

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo ""
    echo "! $INSTALL_DIR is not on your PATH yet. Add this to your shell profile"
    echo "  (~/.zshrc or ~/.bash_profile), then restart your terminal:"
    echo ""
    echo "    export PATH=\"$INSTALL_DIR:\$PATH\""
    echo ""
    ;;
esac

echo "Next: run   any setup"
