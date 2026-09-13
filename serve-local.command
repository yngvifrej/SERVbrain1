#!/bin/bash
set -e
cd "$(dirname "$0")"

mkdir -p models

if [ ! -s models/brain.glb ]; then
  echo "Downloading anatomical brain model (about 4.4 MB)..."
  curl -L --fail --retry 3 \
    "https://raw.githubusercontent.com/itayinbarr/brainproject/main/brain-atlas/models/brain.glb" \
    -o models/brain.glb
fi

echo
echo "Opening local server at http://localhost:8000"
echo "Press Control-C in this window to stop."
echo

python3 -m http.server 8000
