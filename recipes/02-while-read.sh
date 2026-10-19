#!/usr/bin/env bash
# Pattern: iterate over lines safely, preserving spaces and backslashes.
set -euo pipefail

file="${1:-}"
if [[ -z "$file" || ! -r "$file" ]]; then
    printf 'usage: %s <readable file>\n' "$0" >&2
    exit 2
fi

lineno=0
while IFS= read -r line || [[ -n "$line" ]]; do
    lineno=$((lineno + 1))
    printf '%4d: %s\n' "$lineno" "$line"
done < "$file"
