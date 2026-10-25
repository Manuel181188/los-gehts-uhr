#!/bin/sh
# Baut aus index.html (Quelle, auch für die Claude-Vorschau) die installierbare App im Ordner docs/ (wird von GitHub Pages veröffentlicht).
set -e
cd "$(dirname "$0")"
mkdir -p docs/icons docs/fonts
VERSION=$(date +%Y%m%d%H%M%S)
{
  cat <<'HEAD'
<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#DCEEFA">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="Los-geht's">
<link rel="manifest" href="manifest.webmanifest">
<link rel="apple-touch-icon" href="icons/icon-180.png">
<link rel="icon" type="image/png" href="icons/icon-192.png">
<link rel="stylesheet" href="fonts.css">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}</style>
HEAD
  # Quelle ohne Vorschau-spezifische Zeilen (Google-Fonts-Links, Viewport-Hinweis)
  grep -v -e 'fonts.googleapis.com' -e 'fonts.gstatic.com' -e 'claude:viewport-fit-sides' -e 'apple-mobile-web-app-capable' index.html \
    | sed '/^<style>$/i </head>\n<body>'
  cat <<'TAIL'
<script>
if ("serviceWorker" in navigator) addEventListener("load", function () { navigator.serviceWorker.register("sw.js").catch(function () {}); });
</script>
</body>
</html>
TAIL
} > docs/index.html
cp manifest.webmanifest fonts.css docs/
cp fonts/*.woff2 docs/fonts/
cp icons/icon-180.png icons/icon-192.png icons/icon-512.png docs/icons/
FILES=$(cd docs && find . -type f ! -name sw.js ! -name '.nojekyll' | sort | sed 's|^\./||' | awk 'BEGIN{printf "[\"./\""} {printf ", \"%s\"", $0} END{printf "]"}')
sed -e "s|__VERSION__|$VERSION|" -e "s|__FILES__|$FILES|" sw.js.in > docs/sw.js
echo "Fertig: docs/ (Version $VERSION)"
