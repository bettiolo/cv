#!/bin/bash

# Regenerate PDF from Marco Bettiolo CV markdown
# Usage: ./Marco\ Bettiolo\ -\ CTO\ CV\ 2026.sh

cd "$(dirname "$0")"

BASENAME="Marco Bettiolo - CTO CV 2026"

npx md-to-pdf "${BASENAME}.md" \
  --stylesheet "${BASENAME}.css" \
  --pdf-options '{"format": "A4", "margin": "0", "printBackground": true}'

echo "Generated: ${BASENAME}.pdf"
