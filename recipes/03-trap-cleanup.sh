#!/usr/bin/env bash
# Pattern: always clean up temporary files, even on failure or Ctrl+C.
set -euo pipefail

tmpdir="$(mktemp -d)"
cleanup() {
    rm -rf "$tmpdir"
    printf 'cleaned up %s\n' "$tmpdir"
}
trap cleanup EXIT INT TERM

printf 'working in %s\n' "$tmpdir"
printf 'data\n' > "$tmpdir/work.txt"
printf 'processed %s bytes\n' "$(wc -c < "$tmpdir/work.txt")"
