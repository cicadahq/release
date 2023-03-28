#!/usr/bin/env bash

# Check for curl and gh
if ! command -v curl &> /dev/null
then
    echo "curl could not be found"
    exit
fi

if ! command -v gh &> /dev/null
then
    echo "gh could not be found"
    exit
fi

# make a temp directory to download the files
TMP_DIR=$(mktemp -d)

# os based
if [[ $(uname) == "Darwin" ]]; then
    PATTERN="cicada-*-x86_64-apple-darwin.zip"
elif [[ $(uname) == "Linux" ]]; then
    PATTERN="cicada-v0.1.2-x86_64-unknown-linux-musl.tar.gz"
else
    echo "Unsupported OS"
    exit
fi

gh release download --repo "cicadahq/release" --pattern "$PATTERN" --dir "$TMP_DIR"

# extract the file
if [[ $(uname) == "Darwin" ]]; then
    unzip "$TMP_DIR/$PATTERN" -d "$TMP_DIR"
elif [[ $(uname) == "Linux" ]]; then
    tar -xvf "$TMP_DIR/$PATTERN" -C "$TMP_DIR"
else
    echo "Unsupported OS"
    exit
fi

# move the file to the current directory
mv "$TMP_DIR/out/cicada" ~/.local/bin/cicada

echo Make sure to add ~/.local/bin to your PATH