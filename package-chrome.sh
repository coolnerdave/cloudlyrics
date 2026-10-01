#!/bin/bash
rm -f cloudlyrics-chrome.zip
echo "Packaging CloudLyrics for Chrome..."
zip -r cloudlyrics-chrome.zip manifest.json background.js content.js inject.js injected.js analytics.js lyrics.css installed.html icons/ _locales/ -x "*.DS_Store"
echo "Done! The clean package is cloudlyrics-chrome.zip"
