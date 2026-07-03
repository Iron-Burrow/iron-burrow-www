#!/usr/bin/env bash
set -euo pipefail

ZOLA_VERSION="${ZOLA_VERSION:-0.22.0}"
SITE_URL="${SITE_URL:-https://iron-burrow-www.jose-skedar.workers.dev}"

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64)
    ZOLA_TARGET="x86_64-unknown-linux-gnu"
    ;;
  Linux-aarch64 | Linux-arm64)
    ZOLA_TARGET="aarch64-unknown-linux-gnu"
    ;;
  Darwin-x86_64)
    ZOLA_TARGET="x86_64-apple-darwin"
    ;;
  Darwin-arm64)
    ZOLA_TARGET="aarch64-apple-darwin"
    ;;
  *)
    echo "Unsupported platform for Zola download: $(uname -s)-$(uname -m)" >&2
    exit 1
    ;;
esac

curl -L \
  "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-${ZOLA_TARGET}.tar.gz" \
  -o /tmp/zola.tar.gz

tar -xzf /tmp/zola.tar.gz -C /tmp
/tmp/zola build --base-url "$SITE_URL"
