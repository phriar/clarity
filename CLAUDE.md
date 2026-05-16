# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static marketing website for **Clarity Uncorked**, a Bordeaux wine retreat for women. Hosted on GitHub Pages at `clarityuncorked.com`. No build system — pure HTML, CSS, and vanilla JavaScript.

## Development

No build or install step required. Open any `.html` file directly in a browser, or use a local static server:

```bash
python3 -m http.server 8000
```

There are no automated tests. Validation is done manually in a browser.

## Architecture

**Pages** — each `.html` file is self-contained. All pages share `style.css` and include the same nav/footer pattern inline. Pages:
- `index.html` — homepage with hero, about strip, CTA
- `gallery.html` — filterable photo gallery with lightbox (vanilla JS)
- `contact.html` — form backed by Formspree
- Other pages: `about`, `experience`, `feast-for-senses`, `coaching-journey`, `investment`, `faq`

**Design system** — defined as CSS custom properties in `style.css`:

| Variable | Value | Role |
|---|---|---|
| `--wine` | `#5C1A1A` | Primary (burgundy) |
| `--blush` | `#E8C9B0` | Accent |
| `--cream` | `#FAF6F1` | Background |
| `--gold` | `#B8975A` | Highlight |
| `--charcoal` | `#2A2118` | Body text |
| `--sand` | `#EDE4D8` | Secondary bg |

Fonts: **Cormorant Garamond** (headings), **Jost** (body).

**Navigation** — fixed, backdrop-blur nav shared across all pages. Mobile hamburger uses an IIFE pattern with DOM state management; `fix-hamburger.py` can re-apply a canonical version across all pages if the pattern drifts.

**Images** — stored in `images/`. Utility scripts exist for image management (`check-images.sh`, `fix-image-links.sh`, `fix-image-names.sh`); run them from the repo root if image references break. New photos added from iPhone should be converted from HEIC to JPEG using `sips` before committing (e.g. `sips -s format jpeg input.HEIC --out output.jpg`).

**Gallery categories** — `gallery.html` uses `data-cat` attributes for filtering. Current categories:
- `landscape` — French countryside, vineyards, Dordogne river
- `food` — wine, charcuterie, produce, dining
- `retreat` — coaching and retreat atmosphere shots
- `2026` — Clarity Uncorked 2026 retreat photos (27 images added May 2026)

**Forms** — `contact.html` uses Formspree for email delivery (no server-side code).

## Key Constraints

- No JavaScript frameworks or build tools — keep it plain HTML/CSS/JS.
- All pages must share the same nav markup so the hamburger fix script works.
- Images should use WebP where possible; filenames must match references in HTML exactly (case-sensitive on Linux/GitHub Pages).
