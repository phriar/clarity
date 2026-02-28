#!/bin/bash
# ─────────────────────────────────────────────────────────
# fix-image-names.sh
# Run from the root of your clarity repo.
# Deletes the ugly WordPress duplicates, rewrites HTML to
# use your existing clean filenames instead.
# ─────────────────────────────────────────────────────────

echo ""
echo "Remapping ugly WordPress names → your clean filenames..."
echo "────────────────────────────────────"

remap() {
  UGLY="$1"
  CLEAN="$2"

  if [ ! -f "images/$UGLY" ]; then
    return  # wasn't downloaded, nothing to do
  fi

  # Rewrite all HTML files
  for HTML in *.html; do
    sed -i "s|images/$UGLY|images/$CLEAN|g" "$HTML"
    sed -i "s|\"$UGLY\"|\"images/$CLEAN\"|g" "$HTML"
  done

  # Delete the ugly duplicate (clean version already exists)
  if [ -f "images/$CLEAN" ]; then
    rm "images/$UGLY"
    echo "  ✓ deleted duplicate → using: $CLEAN"
  else
    # Clean name didn't exist — just rename it
    mv "images/$UGLY" "images/$CLEAN"
    echo "  ✓ renamed: $UGLY → $CLEAN"
  fi
}

# Hash-named duplicates of existing clean images
remap "1e5ff4affc933d6a76ac1a885647dc4ebb8b374f.jpg"        "canapes.jpg"
remap "3e0f48b424eb15016a861857417702f56ff68ab9.jpg"        "hero-bg.jpg"
remap "5c8bf4572b3aa99a0a4c166161313ac1983d1151.jpg"        "hero-bg.jpg"
remap "311E4256-3799-40E7-8CEE-1528805EDDA9_1_105_c.jpeg"  "anna-bio.jpeg"
remap "604a6032ba630cb2bfacd6fa_image48.png"                "arrival-bordeaux.png"
remap "604f937f5a8b64ca482bbc90_image28-837x1024.png"       "french-countryside.png"
remap "2942e066827d8cfff144c2f3173c66da334a9e33.jpg"        "hero-bg.jpg"
remap "60490f58fc8c4d1b57f562e0_image30.png"                "french-countryside.png"
remap "b4fdf3b4645501dc17015801c4d1245799cfb541.jpg"        "hero-bg.jpg"
remap "B103ACDB-F057-431B-B958-9B61356A89C6_1_105_c.jpeg"  "anna-bio.jpeg"
remap "Artichoke-with-vinaigrette-1024x768.jpeg"            "artichoke.jpeg"
remap "Bottles-of-wine-768x1024.jpg"                        "canapes.jpg"
remap "Canapes-1024x683.jpg"                                "canapes.jpg"
remap "Charcuterie-platter-768x1024.jpeg"                   "charcuterie.jpeg"
remap "de6fa909014ae4148af3ac313e260108d87176da.jpg"        "canapes.jpg"
remap "Sharing-dessert-platter-901x1024.jpeg"               "dessert-platter.jpeg"
remap "The-Dordogne-river-from-Libourne-1-1024x775.jpeg"   "dordogne-river.jpeg"

# These new ones don't have clean equivalents — keep them but rename cleanly
remap "image-7.jpg"    "image-7.jpg"   # same name, no-op
remap "image-9.jpg"    "image-9.jpg"
remap "image-10.jpg"   "image-10.jpg"
remap "image-12.jpg"   "image-12.jpg"
remap "Michael-bio-768x1024.jpeg"  "michael-bio.jpeg"
remap "Jen_Bio-857x1024.jpg"       "jen-bio.jpg"
remap "Val_Santorini.jpeg"         "val-bio.jpeg"

echo ""
echo "Fixing any remaining WordPress URLs in HTML files..."
echo "────────────────────────────────────"
for HTML in *.html; do
  COUNT=$(grep -c "clarityuncorked.com" "$HTML" 2>/dev/null || echo 0)
  if [ "$COUNT" -gt 0 ]; then
    sed -i "s|https://clarityuncorked.com/wp-content/uploads/[0-9]*/[0-9]*/|images/|g" "$HTML"
    echo "  fixed $COUNT WP URLs in: $HTML"
  else
    echo "  clean: $HTML"
  fi
done

echo ""
echo "Remaining images/ contents:"
echo "────────────────────────────────────"
ls images/

echo ""
echo "────────────────────────────────────"
echo "Done! Now run:"
echo "  git add -A"
echo "  git commit -m \"remove duplicate images, use clean filenames\""
echo "  git push"
