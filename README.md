# CloudLyrics 4.0

Synced lyrics and timed community comments for SoundCloud — the feature the platform never shipped.

[![Chrome Web Store](https://img.shields.io/chrome-web-store/v/jbdcddljoojojilncpkkbpignjabnmfa)](https://chromewebstore.google.com/detail/jbdcddljoojojilncpkkbpignjabnmfa)
[![Firefox Add-ons](https://img.shields.io/badge/Firefox-Add--on-FF7139?logo=firefox-browser&logoColor=white)](https://addons.mozilla.org/firefox/addon/cloudlyrics/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Support on Ko-Fi](https://img.shields.io/badge/Support%20on-Ko--Fi-FF5E5B?logo=ko-fi&logoColor=white)](https://ko-fi.com/coolnerdave)

**[cloudlyrics.org](https://www.cloudlyrics.org)**

---

## What's new in 4.1

**Performance pass** — all three running simultaneously (lyrics sync, ambient blobs, flyby comments) now stays smooth. Blob radii reduced to distinct floating orbs, liquid canvas throttled to 24fps, flyby pills GPU-composited, text-shadow trimmed to single layer.

**Community comments** — SoundCloud's famous timed comments appear as quiet italic annotations directly below the lyric line they were left on. No other lyrics tool does this. The crowd becomes part of the song. Free for your first 3 tracks, then premium.

**YouTube KV cache** — video lookups cached for 30 days in Cloudflare KV. Quota no longer a concern at scale.

Also in 4.0:
- Lyrics cached after first load — instant on revisit
- Album art fetched at original resolution
- Copy active lyric line with `C`
- First-run coach mark
- Ambient background overhaul: always-dark base with vivid album-art-derived blobs
- Grey/monochrome album fallback palette (deep indigo instead of flat grey)
- Mini panel readability pass: brighter inactive lines, inline ad-libs hidden, breath-mark note lines
- Redesigned "no lyrics" empty state
- Post-install welcome page with direct first-track CTA

---

## Features

### Core (free)
- **Synced lyrics** — line-by-line highlighting at sub-second precision, smooth scale + glow on the active line
- **Community comments** — timed SoundCloud comments anchored below the lyric line they were written on
- **Click to seek** — tap any lyric line to jump the track to that exact moment
- **Press `C` to copy** — copies the current active line to clipboard while in fullscreen
- **Fullscreen overlay** — press `F` to fill the screen with lyrics and ambient background; press again to close
- **Mini panel** — compact floating panel for browsing while music plays
- **Ambient background** — colour blobs derived from album art drift behind the lyrics; every track has its own mood
- **Art styles** — Default, Vinyl (spinning record + live tonearm), CD (iridescent shimmer), 3D Cube, Video (official music video)
- **Artist info** — Wikipedia and Last.fm bios, pulled on demand for every track
- **Lyric snippet** — capture and share a highlighted lyric
- **Lyrics cache** — persists across page reloads (7-day TTL), instant load on revisit

### Premium (one-time, lifetime)
- **Visual themes** — Glitch, Spotlight, Typewriter
- **Visualisations** — Synthwave, Reactions, Sakura, Snow canvas backgrounds

---

## Installation

### Chrome
[Install from the Chrome Web Store](https://chromewebstore.google.com/detail/jbdcddljoojojilncpkkbpignjabnmfa)

### Firefox
[Install from Firefox Add-ons](https://addons.mozilla.org/firefox/addon/cloudlyrics/)

### Manual / developer
```bash
git clone https://github.com/coolnerdave/cloudlyrics.git
```
- **Chrome/Brave**: go to `chrome://extensions/`, enable Developer Mode, click Load unpacked, select the folder
- **Firefox**: go to `about:debugging`, click This Firefox, Load Temporary Add-on, select `manifest.json`

---

## Usage

Navigate to [soundcloud.com](https://soundcloud.com) and play any track. A floating button appears in the bottom-right — click it to open the mini panel, or press `F` for fullscreen.

| Action | How |
|--------|-----|
| Open fullscreen | `F` key, or click the floating button |
| Seek to a lyric | Click any line in fullscreen |
| Copy active line | `C` key while in fullscreen |
| Close fullscreen | `F` or `Esc` |
| Toggle comments | Style menu → Effects → Comments |
| Change art style | Style menu → Display |
| Change ambience | Style menu → Ambience (premium) |

---

## Architecture

| File | Role |
|------|------|
| `inject.js` | Runs at `document_start`; injects `injected.js` into the page context |
| `injected.js` | Patches `AudioContext` for frequency data; reads SoundCloud session tokens and track IDs from page storage and API intercepts |
| `content.js` | All UI, lyrics fetching, LRC sync, scroll, art styles, visualisations, community comments (~3500 lines) |
| `lyrics.css` | All styles |
| `background.js` | Service worker; fires install/update analytics events |
| `analytics.js` | GA4 Measurement Protocol helper |
| `worker.js` | Cloudflare Worker: Stripe webhook, license key delivery, validation, YouTube video resolution |

**Lyrics** are fetched from [LRCLIB](https://lrclib.net) (primary — synced LRC + plain text) with [lyrics.ovh](https://lyrics.ovh) as a fallback. Cached in `localStorage` for 7 days after first load.

**Community comments** are fetched from SoundCloud's API using the user's session, resolved per-track via the `/resolve` endpoint on each track change.

---

## Localisation

English and Russian. Contributions welcome — add `_locales/[code]/messages.json` following the existing format.

---

## Support

If CloudLyrics adds something to your listening — [support on Ko-Fi](https://ko-fi.com/coolnerdave).

---

## Disclaimer

CloudLyrics is an independent project, not affiliated with or endorsed by SoundCloud Ltd.

## License

[MIT](LICENSE)
