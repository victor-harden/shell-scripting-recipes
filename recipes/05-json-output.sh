#!/usr/bin/env bash
# Pattern: emit JSON from a script without external tools.
set -euo pipefail

json_escape() {
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    printf '%s' "$value"
}

host="$(hostname)"
kernel="$(uname -r)"

printf '{"host":"%s","kernel":"%s","user":"%s"}\n' \
    "$(json_escape "$host")" \
    "$(json_escape "$kernel")" \
    "$(json_escape "${USER:-unknown}")"
