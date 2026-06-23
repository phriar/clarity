# Clarity Uncorked Website

This is the website for **Clarity Uncorked**, hosted for free on GitHub Pages at [clarityuncorked.com](https://clarityuncorked.com).

There's no fancy build process — it's just HTML, CSS, and a little JavaScript. You can open any page in a text editor (or ask Claude Code to do it for you), make a change, and publish it live in a couple of minutes.

This guide covers everything you need to update the site yourself, with or without Claude's help.

---

## How the site works

1. All the website files live in this folder, on your computer.
2. When you "commit and push" your changes (instructions below), GitHub receives the updated files.
3. GitHub Pages automatically republishes the live site — usually within 1-2 minutes.

**Nothing goes live until you push.** You can edit and preview things locally as much as you want with zero risk to the live site.

---

## The easiest way to make changes: ask Claude Code

You likely already have Claude Code set up (that's what's reading this file!). For almost anything — "swap out this photo," "fix a typo on the about page," "add 5 new photos to the gallery" — you can just describe what you want in plain English and Claude will make the edit for you. You don't need to know HTML.

Good example prompts:
- "Replace the hero image on the homepage with images/new-hero.jpg"
- "Add these 6 photos in images/ to the gallery under the 'retreat' category"
- "Change the price on the investment page to $4,200"
- "Fix the typo in the second paragraph of about.html"
- "Commit and push these changes"

Claude can do the git commit/push step for you too — just ask. It will always tell you what it's about to do before pushing anything live.

---

## Making changes yourself (no Claude needed)

### Previewing the site locally

Open any `.html` file (like `index.html`) directly in your web browser by double-clicking it. That's enough to see most changes.

If you want the site to behave exactly like the live version (recommended before pushing big changes), open Terminal in this folder and run:

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000` in your browser. Press `Ctrl+C` in Terminal to stop the server when you're done.

### Editing text

Each page is its own file:

| Page | File |
|---|---|
| Homepage | `index.html` |
| About | `about.html` |
| The Experience | `experience.html` |
| Feast for the Senses | `feast-for-senses.html` |
| Coaching Journey | `coaching-journey.html` |
| Investment / Pricing | `investment.html` |
| FAQ | `faq.html` |
| Gallery | `gallery.html` |
| Contact | `contact.html` |

Open the file in any text editor (TextEdit, VS Code, etc.) and look for the text you want to change. It's plain English inside HTML tags — just edit the words between the `<...>` brackets and save.

### Adding or swapping photos

1. Drop your new photo file into the `images/` folder.
2. **If it's an iPhone photo (HEIC format)**, convert it to JPEG first — HEIC doesn't display reliably in browsers. In Terminal:
   ```bash
   sips -s format jpeg your-photo.HEIC --out images/your-photo.jpg
   ```
3. To swap an existing photo, find its filename in the relevant `.html` file (search for `images/`) and change it to your new filename. Filenames are case-sensitive, so `Photo.jpg` and `photo.jpg` are treated as different files.
4. To add a **new photo to the gallery**, open `gallery.html` and find the `<!-- GALLERY -->` section. Copy one of the existing blocks and edit it:
   ```html
   <div class="masonry-item" data-cat="2026">
     <img src="images/your-photo.jpg" alt="Description of photo" loading="lazy">
     <div class="item-caption">Caption shown under the photo</div>
   </div>
   ```
   The `data-cat` value controls which filter button shows the photo. Current categories: `landscape`, `food`, `retreat`, `2026`.

### Helper scripts (optional, run from Terminal in this folder)

- `./check-images.sh` — checks that every image referenced in the HTML actually exists in `images/`, and flags unused images.
- `./fix-image-links.sh` / `./fix-image-names.sh` — repair broken image references or filename mismatches.
- `python3 fix-hamburger.py` — re-applies the mobile menu (hamburger) code to every page if it ever breaks. Only needed if you've manually edited the navigation.

---

## Publishing changes: git commands

"Git" is the tool that tracks changes and sends them to GitHub, which is what actually makes the site go live. Run these from Terminal, inside this project folder.

### 1. Check what's changed

```bash
git status
```

Shows which files you've edited. Good habit to run this before committing.

### 2. Stage your changes

```bash
git add .
```

This stages *all* your changes. (To stage just one file: `git add filename.html`)

### 3. Commit your changes

```bash
git commit -m "Describe what you changed here"
```

Example: `git commit -m "Update homepage hero photo and fix FAQ typo"`

This saves a snapshot locally — it does **not** go live yet.

### 4. Push to GitHub (this makes it go live)

```bash
git push
```

Within a minute or two, [clarityuncorked.com](https://clarityuncorked.com) will show your changes. You can refresh the live site to confirm.

### A note on logging in (authentication)

If you're using **this same Mac** (same login), `git push` should just work — it's already signed in to GitHub and won't ask for a password.

If you ever set this up on a **different computer**, the first `git push` will likely ask for a username and password. GitHub no longer accepts your regular password here — instead:
- Easiest option: install [GitHub Desktop](https://desktop.github.com), sign in there once, and it'll handle authentication for you (you can still use the `git` commands in Terminal afterward, or just use GitHub Desktop's own commit/push buttons).
- Or ask Claude Code to help you generate a Personal Access Token on GitHub and use that as the password.

### Pulling updates (only needed if you edit from more than one computer)

If you ever make changes on a different computer, run this **before** you start editing, to make sure you have the latest version:

```bash
git pull
```

### The full everyday workflow, start to finish

```bash
git pull                          # make sure you're up to date (skip if only computer you use)
# ...make your edits...
git status                        # see what changed
git add .                         # stage everything
git commit -m "What you changed"  # save a snapshot
git push                          # publish it live
```

---

## If something goes wrong

- **Pushed something by mistake and want to undo it live?** Don't panic, don't run anything destructive — just ask Claude Code to help revert it, or text/call for help. Changes are never truly lost as long as they were committed.
- **A photo doesn't show up on the live site:** double check the filename matches exactly (including capitalization and `.jpg` vs `.jpeg`) and that you ran `git add`, `git commit`, and `git push`.
- **Not sure if your push worked:** run `git status` — it should say "nothing to commit, working tree clean" and "Your branch is up to date with 'origin/main'."
- **When in doubt, ask Claude Code.** Just describe what's wrong in plain English — broken images, layout looking off, a typo you can't find — and it can investigate and fix it for you.
