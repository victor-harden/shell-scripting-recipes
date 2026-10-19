#!/usr/bin/env bash
# Pattern: retry a command with bounded attempts and a delay.
set -euo pipefail

attempts="${1:-3}"
delay="${2:-1}"
command="${3:-true}"

for ((i = 1; i <= attempts; i++)); do
    if bash -c "$command"; then
        printf 'succeeded on attempt %d\n' "$i"
        exit 0
    fi
    printf 'attempt %d failed\n' "$i" >&2
    if ((i < attempts)); then
        sleep "$delay"
    fi
done

printf 'all %d attempts failed\n' "$attempts" >&2
exit 1
