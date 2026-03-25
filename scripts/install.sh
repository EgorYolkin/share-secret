#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_BIN="$PROJECT_ROOT/bin/share-secret"

if [[ ! -f "$SOURCE_BIN" ]]; then
  echo "Error: $SOURCE_BIN not found" >&2
  exit 1
fi

TARGET_DIR="/usr/local/bin"
if [[ -d "/opt/homebrew/bin" ]]; then
  TARGET_DIR="/opt/homebrew/bin"
fi

echo "Installing share-secret to $TARGET_DIR ..."
install -m 0755 "$SOURCE_BIN" "$TARGET_DIR/share-secret"
echo "Done. Run: share-secret \"my text\" \"secret.txt\""
