#!/bin/sh

mkdir -p dist

# Minify Javascript
uglifyjs jg.js -m toplevel -c -o dist/jg.js || exit 1
# Minify HTML
html-minifier --minify-css --collapse-whitespace index.html -o dist/index.html

# Zip the whole thing
ZIP_FILE=jg.zip 
ZIPPED_FILES="index.html jg.js"

cd dist
rm -f $ZIP_FILE
zip -q9 $ZIP_FILE $ZIPPED_FILES || exit 1
cd ..

# Report
FINAL_SIZE=$( wc -c "dist/$ZIP_FILE" | awk '{print $1}')
echo "Final size: \n\t\033[1m$FINAL_SIZE\033[0m bytes"
