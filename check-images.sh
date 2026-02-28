#!/bin/bash
# Run from your clarity repo root
# Checks which images the HTML needs and downloads any missing ones

BASE="https://clarityuncorked.com/wp-content/uploads"

# What the HTML expects → where to get it if missing
declare -A SOURCES=(
  ["images/image-7.jpg"]="$BASE/2025/09/image-7.jpg"
  ["images/image-9.jpg"]="$BASE/2025/11/image-9.jpg"
  ["images/image-10.jpg"]="$BASE/2025/11/image-10.jpg"
  ["images/image-12.jpg"]="$BASE/2025/11/image-12.jpg"
  ["images/arrival-bordeaux.png"]="$BASE/2025/10/604a6032ba630cb2bfacd6fa_image48.png"
  ["images/french-countryside.png"]="$BASE/2025/10/604f937f5a8b64ca482bbc90_image28-837x1024.png"
  ["images/hero-bg.jpg"]="$BASE/2025/10/b4fdf3b4645501dc17015801c4d1245799cfb541.jpg"
  ["images/dordogne-river.jpeg"]="$BASE/2025/11/The-Dordogne-river-from-Libourne-1-1024x775.jpeg"
  ["images/michael-bio.jpeg"]="$BASE/2025/11/Michael-bio-768x1024.jpeg"
  ["images/jen-bio.jpg"]="$BASE/2025/11/Jen_Bio-857x1024.jpg"
  ["images/val-bio.jpeg"]="$BASE/2025/11/Val_Santorini.jpeg"
  ["images/anna-bio.jpeg"]="$BASE/2025/11/311E4256-3799-40E7-8CEE-1528805EDDA9_1_105_c.jpeg"
  ["images/canapes.jpg"]="$BASE/2025/11/Canapes-1024x683.jpg"
  ["images/artichoke.jpeg"]="$BASE/2025/11/Artichoke-with-vinaigrette-1024x768.jpeg"
  ["images/charcuterie.jpeg"]="$BASE/2025/11/Charcuterie-platter-768x1024.jpeg"
  ["images/dessert-platter.jpeg"]="$BASE/2025/11/Sharing-dessert-platter-901x1024.jpeg"
  ["images/sainte-foy-grande-28631_w400.webp"]="$BASE/2025/10/sainte-foy-grande-28631_w400.webp"
)

echo ""
echo "Checking all 17 required images..."
echo "────────────────────────────────────"
MISSING=0
for LOCAL in "${!SOURCES[@]}"; do
  if [ -f "$LOCAL" ]; then
    echo "  ✓ $(basename $LOCAL)"
  else
    echo "  ✗ MISSING: $LOCAL — downloading..."
    curl -s -o "$LOCAL" "${SOURCES[$LOCAL]}" && echo "    → downloaded" || echo "    → FAILED"
    ((MISSING++))
  fi
done

echo ""
echo "────────────────────────────────────"
echo "Done. $MISSING image(s) were missing and downloaded."
echo ""
if [ $MISSING -gt 0 ]; then
  echo "Now run:"
  echo "  git add images/"
  echo "  git commit -m \"add missing images\""
  echo "  git push"
fi
