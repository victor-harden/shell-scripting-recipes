#!/usr/bin/env bash
# Pattern: arrays, correct quoting and iteration.
set -euo pipefail

services=("nginx" "postgres" "redis")
declare -A ports=([nginx]=80 [postgres]=5432 [redis]=6379)

printf 'count: %d\n' "${#services[@]}"
for service in "${services[@]}"; do
    printf '%s listens on %s\n' "$service" "${ports[$service]}"
done

# Append and remove safely without word splitting.
services+=("worker")
unset 'services[1]'
printf 'after change: %s\n' "${services[*]}"
