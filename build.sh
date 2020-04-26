#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## clean up temp files
mkdir -p "$SCRIPT_DIR/build"
rm -rf "$SCRIPT_DIR/build/*.apib"

# prepare data structures include temp file
cat /dev/null > "$SCRIPT_DIR/build/resources.apib"
cd "$SCRIPT_DIR/src/resources" || exit
for file in *.apib
do
  [[ -e "$file" ]] || break  # handle the case of no *.wav files
  echo "<!-- include(../src/resources/$file) -->" >> "$SCRIPT_DIR/build/resources.apib"
done

# prepare groups include temp file
cat /dev/null > "$SCRIPT_DIR/build/groups.apib"
cd "$SCRIPT_DIR/src/groups" || exit
for file in *.apib
do
  [[ -e "$file" ]] || break  # handle the case of no *.wav files
  echo "<!-- include(../src/groups/$file) -->" >> "$SCRIPT_DIR/build/groups.apib"
done

## build documentation
cd "$SCRIPT_DIR" || exit
aglio --theme-variables slate --theme-style default --theme-style custom.less -i include/index.apib -o dist/index.html
