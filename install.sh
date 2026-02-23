#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${BIN_DIR:-$HOME/.local/bin}"
TARGET="${BIN_DIR}/keisk"
URL="https://raw.githubusercontent.com/LiutsLT/keisk-linux/main/keisk-linux"

mkdir -p "$BIN_DIR"
MODE="Įdiegta"
[[ -f "$TARGET" ]] && MODE="Atnaujinta"

curl -fsSL "$URL" -o "$TARGET"
chmod +x "$TARGET"

VERSION="unknown"
if grep -q "^KEISK_VERSION=" "$TARGET" 2>/dev/null; then
  VERSION="$(grep -m1 "^KEISK_VERSION=" "$TARGET" | cut -d'"' -f2)"
fi

echo "✅ ${MODE}: $TARGET"
echo "🔖 Versija: ${VERSION}"
echo
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "ℹ️ $BIN_DIR nėra PATH. Pridėk į shell rc:"
  echo "   echo 'export PATH=\"$BIN_DIR:\$PATH\"' >> ~/.bashrc && source ~/.bashrc"
else
  echo "✅ PATH jau turi $BIN_DIR"
fi

echo "Paleidimas: keisk"
