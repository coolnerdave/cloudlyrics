#!/bin/bash
rm -f cloudlyrics-chrome.zip
echo "Packaging CloudLyrics for Chrome..."
zip -r cloudlyrics-chrome.zip manifest.json background.js content.js inject.js injected.js analytics.js worker.js lyrics.css icons/ _locales/
echo "Done! The clean package is cloudlyrics-chrome.zip"
