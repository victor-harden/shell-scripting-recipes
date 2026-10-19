# shell-scripting-recipes

Short, tested Bash recipes for the patterns you reach for every week. Each recipe
is a runnable script with a comment explaining *why* it is written that way.

## Recipes

| Script | Pattern |
|---|---|
| `recipes/01-args.sh` | Strict mode, `getopts`, `--help` |
| `recipes/02-while-read.sh` | Safe line iteration with `while IFS= read -r` |
| `03-trap-cleanup.sh` | `trap` for temporary files |
| `04-arrays.sh` | Arrays, quoting, `${arr[@]}` |
| `05-json-output.sh` | Structured output without `jq` |
| `06-retry.sh` | Retry with bounded attempts and sleep |

## Features

- Every script starts with `set -euo pipefail`.
- `tests/run_tests.sh` executes each recipe and asserts its output.
- `shellcheck` clean at warning level (CI runs it).

## Installation

```bash
git clone https://github.com/victor-harden/shell-scripting-recipes.git
cd shell-scripting-recipes
chmod +x recipes/*.sh tests/*.sh
```

## Usage

```bash
./recipes/01-args.sh --name Victor --count 3
./recipes/02-while-read.sh /etc/hosts
./recipes/04-arrays.sh
```

## Tests

```bash
bash tests/run_tests.sh
```

## License

MIT — see [LICENSE](LICENSE).
