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

grep -n -- "--provider" "$ACTIVE_BIN" >/dev/null 2>&1 \
  && echo "⚠️ dėmesio: aktyviame faile rastas '--provider'" \
  || echo "✅ aktyviame faile '--provider' nėra"

VERSION="unknown"
if command -v python3 >/dev/null 2>&1; then
  VERSION="$(curl -fsSL https://api.github.com/repos/LiutsLT/keisk-linux/commits/main 2>/dev/null | python3 -c 'import sys,json
try:
 d=json.load(sys.stdin); print((d.get("sha") or "unknown")[:7])
except Exception:
 print("unknown")')"
fi

echo "versija(repo main): $VERSION"
echo "Paleidimas: keisk"
