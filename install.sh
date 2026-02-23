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
if command -v python3 >/dev/null 2>&1; then
  VERSION="$(curl -fsSL https://api.github.com/repos/LiutsLT/keisk-linux/commits/main 2>/dev/null | python3 -c 'import sys,json
try:
 d=json.load(sys.stdin); print((d.get("sha") or "unknown")[:7])
except Exception:
 print("unknown")')"
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
