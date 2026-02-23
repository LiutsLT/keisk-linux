#!/usr/bin/env bash
set -euo pipefail

INSTALL_URL="https://raw.githubusercontent.com/LiutsLT/keisk-linux/main/install.sh"

bash <(curl -fsSL "$INSTALL_URL")

echo
echo "--- Aktyvi instaliacija ---"
if ! command -v keisk >/dev/null 2>&1; then
  echo "❌ 'keisk' nerastas PATH"
  exit 1
fi

ACTIVE_BIN="$(command -v keisk)"
echo "kelias: $ACTIVE_BIN"

grep -n -- "models auth add --provider" "$ACTIVE_BIN" >/dev/null 2>&1 \
  && echo "⚠️ aktyviame faile rasta sena komanda su --provider" \
  || echo "✅ aktyviame faile nėra probleminės --provider komandos"

VERSION="unknown"
if grep -q "^KEISK_VERSION=" "$ACTIVE_BIN" 2>/dev/null; then
  VERSION="$(grep -m1 "^KEISK_VERSION=" "$ACTIVE_BIN" | cut -d'"' -f2)"
fi

echo "versija(aktyvi): $VERSION"
echo "Paleidimas: keisk"
