#!/bin/bash
# Build CloudLyrics Firefox add-on zip
# Usage: bash package-firefox.sh
# Output: cloudlyrics-firefox.zip

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TMP_DIR="$(mktemp -d)"
OUT="$SCRIPT_DIR/cloudlyrics-firefox.zip"

echo "Building Firefox package..."

# Copy all extension files to tmp dir
rsync -a \
  --exclude='.git' --exclude='.agents' --exclude='.claude' \
  --exclude='*.sh' --exclude='*.py' --exclude='*.command' \
  --exclude='HANDOFF.md' --exclude='CLAUDE.md' --exclude='PROMPTER_NOTES.md' \
  --exclude='cloudlyrics-bot' --exclude='*.zip' --exclude='build' \
  --exclude='node_modules' --exclude='skills-lock.json' \
  --exclude='index.html' --exclude='index-draft.html' --exclude='menu-concepts.html' \
  --exclude='worker.js' --exclude='sitemap.xml' --exclude='robots.txt' \
  --exclude='CNAME' --exclude='preview.png' --exclude='demo.mp4' \
  "$SCRIPT_DIR/" "$TMP_DIR/"

# Patch manifest.json for Firefox
node -e "
const fs = require('fs');
const m = JSON.parse(fs.readFileSync('$TMP_DIR/manifest.json', 'utf8'));

// Firefox requires service_worker paired with scripts fallback
m.background = { service_worker: 'background.js', scripts: ['background.js'] };

// Gecko settings with data_collection_permissions (required for new extensions)
m.browser_specific_settings = {
  gecko: {
    id: 'cloudlyrics@coolnerdave',
    strict_min_version: '109.0',
    data_collection_permissions: {
      required: ['none'],
      optional: []
    }
  }
};

fs.writeFileSync('$TMP_DIR/manifest.json', JSON.stringify(m, null, 2));
"

# Package
rm -f "$OUT"
cd "$TMP_DIR"
zip -r "$OUT" . -x "*.DS_Store"
cd "$SCRIPT_DIR"

# Cleanup
rm -rf "$TMP_DIR"

echo "Done: cloudlyrics-firefox.zip"
