#!/bin/bash

set -euo pipefail

# Regenerate a CV PDF.
# Usage: ./generate-cv.sh <input-md>

cd "$(dirname "$0")"

SOURCE_CSS="cv.css"
MONTH_YEAR="$(date '+%b %Y')"
OUTPUT_PDF="Marco Bettiolo - CTO CV $MONTH_YEAR.pdf"

if [ "$#" -ne 1 ]; then
  echo "Usage: ./generate-cv.sh <input-md>" >&2
  exit 1
fi

SOURCE_MD="$1"

if [ ! -f "$SOURCE_MD" ]; then
  echo "Input Markdown file not found: $SOURCE_MD" >&2
  exit 1
fi

case "$SOURCE_MD" in
  "cv.md"|"cv--the-aid.md")
    ;;
  *)
    echo "Unsupported CV source: $SOURCE_MD" >&2
    echo "Ask the user to add support to generate-cv.sh before generating this PDF." >&2
    exit 1
    ;;
esac

INTERMEDIATE_PDF="${SOURCE_MD%.md}.pdf"

npx md-to-pdf "$SOURCE_MD" \
  --stylesheet "$SOURCE_CSS" \
  --page-media-type print \
  --pdf-options '{"format":"A4","printBackground":true}' \
  --launch-options '{"executablePath":"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"}'

mv "$INTERMEDIATE_PDF" "$OUTPUT_PDF"

echo "Generated: $OUTPUT_PDF"
