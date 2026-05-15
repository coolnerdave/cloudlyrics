# Privacy Policy

**Last updated: May 2026**

CloudLyrics is a browser extension that displays lyrics for tracks playing on SoundCloud.

## Data we collect

CloudLyrics collects minimal anonymous data for product improvement only:

- **Install and update events** — when you first install or update the extension, a single anonymous event is sent to Google Analytics 4. This contains no personal information, no user identifier, and no browsing data. It is used solely to count how many people are using the extension.

We do not collect, store, or sell any personal data. We do not track your listening history, browsing behaviour, or any identifying information.

## Network requests made by the extension

CloudLyrics makes the following outbound requests to provide its features:

| Destination | Purpose |
|---|---|
| `lrclib.net` | Fetch synced lyrics for the current track |
| `api.lyrics.ovh` | Fallback lyrics source |
| `api-v2.soundcloud.com` | Fetch timed community comments for the current track (uses your SoundCloud session) |
| `ws.audioscrobbler.com` (Last.fm) | Fetch artist bio, genre tags, listener count, and similar artists |
| `en.wikipedia.org` | Fetch artist and song summaries |
| `api.mymemory.translated.net` | Translate the active lyric line on request (T key). Only the lyric text is sent — no user data. |
| `cloudlyrics-worker.thekidslush.workers.dev` | License key validation and YouTube video resolution for art styles |
| `www.google-analytics.com` | Anonymous install/update event (see above) |

Requests to lyrics and artist info sources contain only the track title and artist name visible in the SoundCloud player. No personal or identifying information is transmitted.

## Data stored locally

- **Style preferences** — your chosen background, art style, and visual theme are stored in `chrome.storage.local`. This data never leaves your device.
- **Lyrics cache** — fetched lyrics are cached in `localStorage` for up to 7 days so they load instantly on revisit. The cache is keyed by artist name and track title only. It is never transmitted anywhere.
- **Comments trial count** — if you use the timed comments feature, the number of tracks you've tried it on is stored in `chrome.storage.local` to enforce the free trial limit. This never leaves your device.

## Permissions

The extension requests the following permissions:

- **`https://soundcloud.com/*`** — to read the currently playing track
- **`https://api-v2.soundcloud.com/*`** — to fetch timed comments
- **`https://lrclib.net/*`** — to fetch lyrics
- **`https://api.lyrics.ovh/*`** — to fetch lyrics (fallback)
- **`https://en.wikipedia.org/*`** — to fetch artist and song information
- **`https://ws.audioscrobbler.com/*`** — to fetch artist information
- **`https://api.mymemory.translated.net/*`** — to translate lyrics on demand
- **`https://www.google-analytics.com/*`** — for anonymous install/update events
- **`storage`** — to save your preferences locally

## Third-party services

- **Stripe** — if you purchase premium access, payment is processed entirely by Stripe. CloudLyrics never sees or stores your payment details.
- **Cloudflare Workers** — our backend handles license key delivery and YouTube video lookup. No personal data is stored.

## Changes to this policy

If the extension changes in a way that affects privacy, this document will be updated. The full version history is visible in the [GitHub commit log](https://github.com/coolnerdave/cloudlyrics/commits/main/PRIVACY.md).

## Contact

Questions or concerns: [github.com/coolnerdave/cloudlyrics/issues](https://github.com/coolnerdave/cloudlyrics/issues) or coolnerdave@gmail.com
