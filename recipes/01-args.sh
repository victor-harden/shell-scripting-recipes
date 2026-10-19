#!/usr/bin/env bash
# Pattern: strict mode and option parsing with getopts.
set -euo pipefail

name="world"
count=1
usage() { printf 'usage: %s [-n name] [-c count]\n' "$0"; }

while getopts ":n:c:h" opt; do
    case "$opt" in
        n) name="$OPTARG" ;;
        c) count="$OPTARG" ;;
        h) usage; exit 0 ;;
        :) printf 'missing argument for -%s\n' "$OPTARG" >&2; exit 2 ;;
        \?) printf 'unknown option: -%s\n' "$OPTARG" >&2; exit 2 ;;
    esac
done

for ((i = 1; i <= count; i++)); do
    printf 'hello, %s (%d)\n' "$name" "$i"
done
