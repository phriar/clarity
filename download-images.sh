#!/bin/bash
mkdir -p images

echo "Downloading images..."

curl -o images/vineyard.jpg "https://clarityuncorked.com/wp-content/uploads/2025/10/b4fdf3b4645501dc17015801c4d1245799cfb541.jpg"
curl -o images/retreat-setting.jpg "https://clarityuncorked.com/wp-content/uploads/2025/10/2942e066827d8cfff144c2f3173c66da334a9e33.jpg"
curl -o images/hero-bg.jpg "https://clarityuncorked.com/wp-content/uploads/2025/09/image-7.jpg"
curl -o images/retreat-atmosphere.jpg "https://clarityuncorked.com/wp-content/uploads/2025/10/3e0f48b424eb15016a861857417702f56ff68ab9.jpg"
curl -o images/french-countryside.jpg "https://clarityuncorked.com/wp-content/uploads/2025/10/5c8bf4572b3aa99a0a4c166161313ac1983d1151.jpg"
curl -o images/dordogne-river.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/The-Dordogne-river-from-Libourne-1-1024x775.jpeg"
curl -o images/wine-bottles.jpg "https://clarityuncorked.com/wp-content/uploads/2025/11/Bottles-of-wine-768x1024.jpg"
curl -o images/val-santorini.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/Val_Santorini.jpeg"
curl -o images/jen-bio.jpg "https://clarityuncorked.com/wp-content/uploads/2025/11/Jen_Bio-857x1024.jpg"
curl -o images/anna-bio.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/311E4256-3799-40E7-8CEE-1528805EDDA9_1_105_c.jpeg"
curl -o images/michael-bio.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/Michael-bio-768x1024.jpeg"
curl -o images/arrival-bordeaux.png "https://clarityuncorked.com/wp-content/uploads/2025/10/604a6032ba630cb2bfacd6fa_image48.png"
curl -o images/wine-tasting.png "https://clarityuncorked.com/wp-content/uploads/2025/10/604f937f5a8b64ca482bbc90_image28-837x1024.png"
curl -o images/vineyard-views.png "https://clarityuncorked.com/wp-content/uploads/2025/10/60490f58fc8c4d1b57f562e0_image30.png"
curl -o images/sainte-foy.webp "https://clarityuncorked.com/wp-content/uploads/2025/10/sainte-foy-grande-28631_w400.webp"
curl -o images/charcuterie.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/Charcuterie-platter-768x1024.jpeg"
curl -o images/dessert-platter.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/Sharing-dessert-platter-901x1024.jpeg"
curl -o images/artichoke.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/Artichoke-with-vinaigrette-1024x768.jpeg"
curl -o images/canapes.jpg "https://clarityuncorked.com/wp-content/uploads/2025/11/Canapes-1024x683.jpg"
curl -o images/retreat-moment.jpeg "https://clarityuncorked.com/wp-content/uploads/2025/11/B103ACDB-F057-431B-B958-9B61356A89C6_1_105_c.jpeg"
curl -o images/local-produce.png "https://clarityuncorked.com/wp-content/uploads/2025/10/604f937f5a8b64ca482bbc90_image28-837x1024.png"

echo "Done! All images saved to ./images/"
