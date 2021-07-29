#!/bin/bash

set -euo pipefail

abort() {
    echo "E: $*" >&2
    exit 1
}

find_download_url() {
    curl -sL $1 |
    sed -rne '/browser_download_url/s,.*(https://.*)".*,\1,p' |
    while read u; do
        case $u in
            $2)
                echo $u
                break
                ;;
        esac
    done
}

RELEASE=${1-latest}
PATTERN=${2-}

if test "$RELEASE" != latest; then
    RELEASE="tags/$RELEASE"
fi
RELEASE_URL="https://api.github.com/repos/gohugoio/hugo/releases/$RELEASE"

if test -z "$PATTERN"; then
    ARCH=$(uname -s)-$(uname -m)
    case "$ARCH" in
        Linux-x86_64)  PATTERN='*/hugo_extended_*_Linux-64bit.tar.gz' ;;
        Darwin-x86_64) PATTERN='*/hugo_extended_*_macOS-64bit.tar.gz' ;;
        Darwin-arm64)  PATTERN='*/hugo_extended_*_macOS-ARM64.tar.gz' ;;
        *)             abort "Unsupported architecture $ARCH" ;;
    esac
fi

DOWNLOAD_URL=$(find_download_url "$RELEASE_URL" "$PATTERN")
if test -z "$DOWNLOAD_URL"; then
    abort "Download URL pattern '$PATTERN' not found in $RELEASE_URL"
fi

echo "Extracting hugo from $DOWNLOAD_URL"
curl -sL $DOWNLOAD_URL | tar -xzvvf - hugo
chmod +x hugo
