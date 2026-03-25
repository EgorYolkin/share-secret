#!/usr/bin/env bash
set -euo pipefail

REPO="${REPO:-<YOUR_GITHUB_USER>/share-secret}"
REF="${REF:-main}"
URL="https://raw.githubusercontent.com/${REPO}/${REF}/bin/share-secret"

TARGET_DIR="/usr/local/bin"
if [[ -d "/opt/homebrew/bin" ]]; then
  TARGET_DIR="/opt/homebrew/bin"
fi

TMP_FILE="$(mktemp)"
cleanup() {
  rm -f "$TMP_FILE"
}
trap cleanup EXIT

curl -fsSL "$URL" -o "$TMP_FILE"
install -m 0755 "$TMP_FILE" "$TARGET_DIR/share-secret"

echo "Installed to $TARGET_DIR/share-secret"
echo "Run: share-secret \"my text\" \"secret.txt\""
