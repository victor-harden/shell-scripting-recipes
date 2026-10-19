#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

pass=0
fail=0

check() {
    local name="$1"
    shift
    if "$@" >/dev/null 2>&1; then
        printf 'PASS %s\n' "$name"
        pass=$((pass + 1))
    else
        printf 'FAIL %s\n' "$name"
        fail=$((fail + 1))
    fi
}

check "args default output" bash -c './recipes/01-args.sh | grep -q "hello, world"'
check "args custom name" bash -c './recipes/01-args.sh -n Victor -c 2 | grep -q "hello, Victor (2)"'
check "args help" bash -c './recipes/01-args.sh -h | grep -q usage'
check "args unknown option exits 2" bash -c './recipes/01-args.sh -z >/dev/null 2>&1; [ $? -eq 2 ]'

tmpfile="$(mktemp)"
printf 'line one\nline two\n' > "$tmpfile"
check "while-read numbers lines" bash -c "./recipes/02-while-read.sh '$tmpfile' | grep -q '1: line one'"
rm -f "$tmpfile"

check "trap cleans up" bash -c './recipes/03-trap-cleanup.sh | grep -q "cleaned up"'
check "arrays output" bash -c './recipes/04-arrays.sh | grep -q "nginx listens on 80"'
check "json is valid" bash -c './recipes/05-json-output.sh | python3 -m json.tool >/dev/null'
check "retry succeeds" bash -c './recipes/06-retry.sh 2 0 true | grep -q "succeeded"'
check "retry fails" bash -c './recipes/06-retry.sh 1 0 false >/dev/null 2>&1; [ $? -eq 1 ]'

printf '\n%d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]
