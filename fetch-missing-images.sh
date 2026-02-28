#!/bin/bash
# ─────────────────────────────────────────────────────────
# fetch-missing-images.sh
# Run from the root of your clarity repo.
# Downloads any images the site needs that aren't already
# in the images/ folder, then prints the sed command to
# rewrite all src URLs in the HTML files.
# ─────────────────────────────────────────────────────────

mkdir -p images

BASE="https://clarityuncorked.com/wp-content/uploads"

# Full list of images the site references
IMAGES=(
  "2025/09/image-7.jpg"
  "2025/10/2942e066827d8cfff144c2f3173c66da334a9e33.jpg"
  "2025/10/3e0f48b424eb15016a861857417702f56ff68ab9.jpg"
  "2025/10/5c8bf4572b3aa99a0a4c166161313ac1983d1151.jpg"
  "2025/10/60490f58fc8c4d1b57f562e0_image30.png"
  "2025/10/604a6032ba630cb2bfacd6fa_image48.png"
  "2025/10/604f937f5a8b64ca482bbc90_image28-837x1024.png"
  "2025/10/b4fdf3b4645501dc17015801c4d1245799cfb541.jpg"
  "2025/10/sainte-foy-grande-28631_w400.webp"
  "2025/11/1e5ff4affc933d6a76ac1a885647dc4ebb8b374f.jpg"
  "2025/11/311E4256-3799-40E7-8CEE-1528805EDDA9_1_105_c.jpeg"
  "2025/11/604f937f5a8b64ca482bbc90_image28-837x1024.png"
  "2025/11/Artichoke-with-vinaigrette-1024x768.jpeg"
  "2025/11/B103ACDB-F057-431B-B958-9B61356A89C6_1_105_c.jpeg"
  "2025/11/Bottles-of-wine-768x1024.jpg"
  "2025/11/Canapes-1024x683.jpg"
  "2025/11/Charcuterie-platter-768x1024.jpeg"
  "2025/11/Jen_Bio-857x1024.jpg"
  "2025/11/Michael-bio-768x1024.jpeg"
  "2025/11/Sharing-dessert-platter-901x1024.jpeg"
  "2025/11/The-Dordogne-river-from-Libourne-1-1024x775.jpeg"
  "2025/11/Val_Santorini.jpeg"
  "2025/11/de6fa909014ae4148af3ac313e260108d87176da.jpg"
  "2025/11/image-10.jpg"
  "2025/11/image-12.jpg"
  "2025/11/image-9.jpg"
)

echo ""
echo "Checking images..."
echo "────────────────────────────────────"

DOWNLOADED=0
SKIPPED=0
FAILED=0

for IMG_PATH in "${IMAGES[@]}"; do
  FILENAME=$(basename "$IMG_PATH")
  LOCAL="images/$FILENAME"

  if [ -f "$LOCAL" ]; then
    echo "  ✓ already exists: $FILENAME"
    ((SKIPPED++))
  else
    URL="$BASE/$IMG_PATH"
    echo -n "  ↓ downloading: $FILENAME ... "
    HTTP=$(curl -s -o "$LOCAL" -w "%{http_code}" "$URL")
    if [ "$HTTP" = "200" ]; then
      echo "done"
      ((DOWNLOADED++))
    else
      echo "FAILED (HTTP $HTTP)"
      rm -f "$LOCAL"
      ((FAILED++))
    fi
  fi
done

echo ""
echo "────────────────────────────────────"
echo "  Downloaded: $DOWNLOADED"
echo "  Already had: $SKIPPED"
echo "  Failed: $FAILED"
echo ""

if [ "$DOWNLOADED" -gt 0 ] || [ "$SKIPPED" -gt 0 ]; then
  echo "Rewriting src URLs in HTML files..."
  for HTML in *.html; do
    sed -i "s|https://clarityuncorked.com/wp-content/uploads/2025/09/|images/|g" "$HTML"
    sed -i "s|https://clarityuncorked.com/wp-content/uploads/2025/10/|images/|g" "$HTML"
    sed -i "s|https://clarityuncorked.com/wp-content/uploads/2025/11/|images/|g" "$HTML"
    echo "  updated: $HTML"
  done
  echo ""
  echo "Done! Now run:"
  echo "  git add images/ *.html"
  echo "  git commit -m \"self-host all images, remove WordPress dependency\""
  echo "  git push"
fi
