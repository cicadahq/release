#!/bin/sh

# Check for curl and gh
if ! command -v curl >/dev/null 2>&1; then
    echo "curl could not be found"
    exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
    echo "gh could not be found"
    exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
    echo "Warning: docker could not be found, you will not be able to use cicada"
fi

if ! command -v deno >/dev/null 2>&1; then
    echo "Warning: deno could not be found, you will not be able to use cicada"
fi

# make a temp directory to download the files
TMP_DIR=$(mktemp -d)

# os based
UNAME=$(uname)
if [ "$UNAME" = "Darwin" ]; then
    PATTERN="cicada-*-x86_64-apple-darwin.zip"
elif [ "$UNAME" = "Linux" ]; then
    PATTERN="cicada-*-x86_64-unknown-linux-musl.tar.gz"
else
    echo "Unsupported OS"
    exit 1
fi

gh release download --repo "cicadahq/release" --pattern "$PATTERN" --dir "$TMP_DIR"

# extract the file
if [ "$UNAME" = "Darwin" ]; then
    unzip "$TMP_DIR/$PATTERN" -d "$TMP_DIR"
elif [ "$UNAME" = "Linux" ]; then
    tar -xvf "$TMP_DIR/$PATTERN" -C "$TMP_DIR"
else
    echo "Unsupported OS"
    exit 1
fi

# move the file to the current directory
mv "$TMP_DIR/out/cicada" ~/.local/bin/cicada

echo Make sure to add ~/.local/bin to your PATH