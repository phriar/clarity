#!/bin/bash
echo "Fixing image links in HTML files..."

# index.html images
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/b4fdf3b4645501dc17015801c4d1245799cfb541.jpg|images/vineyard.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/2942e066827d8cfff144c2f3173c66da334a9e33.jpg|images/retreat-setting.jpg|g' *.html

# shared hero background
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/09/image-7.jpg|images/hero-bg.jpg|g' *.html

# about page images
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/3e0f48b424eb15016a861857417702f56ff68ab9.jpg|images/retreat-atmosphere.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/5c8bf4572b3aa99a0a4c166161313ac1983d1151.jpg|images/french-countryside.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/The-Dordogne-river-from-Libourne-1-1024x775.jpeg|images/dordogne-river.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Bottles-of-wine-768x1024.jpg|images/wine-bottles.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Val_Santorini.jpeg|images/val-santorini.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Jen_Bio-857x1024.jpg|images/jen-bio.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/311E4256-3799-40E7-8CEE-1528805EDDA9_1_105_c.jpeg|images/anna-bio.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Michael-bio-768x1024.jpeg|images/michael-bio.jpeg|g' *.html

# gallery + experience images
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/604a6032ba630cb2bfacd6fa_image48.png|images/arrival-bordeaux.png|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/604f937f5a8b64ca482bbc90_image28-837x1024.png|images/wine-tasting.png|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/60490f58fc8c4d1b57f562e0_image30.png|images/vineyard-views.png|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/10/sainte-foy-grande-28631_w400.webp|images/sainte-foy.webp|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Charcuterie-platter-768x1024.jpeg|images/charcuterie.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Sharing-dessert-platter-901x1024.jpeg|images/dessert-platter.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Artichoke-with-vinaigrette-1024x768.jpeg|images/artichoke.jpeg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/Canapes-1024x683.jpg|images/canapes.jpg|g' *.html
sed -i '' 's|https://clarityuncorked.com/wp-content/uploads/2025/11/B103ACDB-F057-431B-B958-9B61356A89C6_1_105_c.jpeg|images/retreat-moment.jpeg|g' *.html

echo "Done! Run this to verify nothing is left:"
echo "grep -r 'clarityuncorked.com/wp-content' *.html"
