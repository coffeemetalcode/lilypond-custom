#!/usr/bin/env bash
# scripts/batch-build.sh
# Compile all LilyPond source files found under a directory tree.
#
# Usage:
#   ./scripts/batch-build.sh [OPTIONS] [search-dir]
#
# Examples:
#   ./scripts/batch-build.sh                     # compile all .ly files below cwd
#   ./scripts/batch-build.sh scores/             # compile all .ly in scores/
#   ./scripts/batch-build.sh -o build/ scores/   # send output to build/
#
# Requirements: lilypond must be available on PATH.

set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────────
OUTPUT_DIR=""
SEARCH_DIR="."
VERBOSE=false
JOBS=1          # parallel jobs (set to number of CPU cores for speed)
ERRORS=0

# ── Parse arguments ────────────────────────────────────────────────────────
print_usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] [search-dir]

Options:
  -o <dir>    Common output directory for all PDFs (default: next to each .ly)
  -j <n>      Number of parallel compile jobs (default: 1)
  -v          Verbose: show full LilyPond log for each file
  -h          Show this help message
EOF
}

while getopts "o:j:vh" opt; do
  case "$opt" in
    o) OUTPUT_DIR="$OPTARG" ;;
    j) JOBS="$OPTARG" ;;
    v) VERBOSE=true ;;
    h) print_usage; exit 0 ;;
    *) print_usage; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

if [[ $# -ge 1 ]]; then
  SEARCH_DIR="$1"
fi

if [[ ! -d "$SEARCH_DIR" ]]; then
  echo "Error: directory not found: $SEARCH_DIR" >&2
  exit 1
fi

# ── Check for LilyPond ────────────────────────────────────────────────────
if ! command -v lilypond &>/dev/null; then
  echo "Error: 'lilypond' not found on PATH." >&2
  echo "Download LilyPond from https://lilypond.org/download.html" >&2
  exit 1
fi

# ── Collect source files ───────────────────────────────────────────────────
mapfile -t SOURCES < <(find "$SEARCH_DIR" -name "*.ly" | sort)

if [[ ${#SOURCES[@]} -eq 0 ]]; then
  echo "No .ly files found under: $SEARCH_DIR"
  exit 0
fi

echo "Found ${#SOURCES[@]} file(s) to compile."

# ── Compile function ────────────────────────────────────────────────────────
compile_one() {
  local src="$1"
  local out_dir

  if [[ -n "$OUTPUT_DIR" ]]; then
    out_dir="$OUTPUT_DIR"
  else
    out_dir="$(dirname "$src")"
  fi

  mkdir -p "$out_dir"

  local args=("--output=$out_dir")

  if [[ "$VERBOSE" == true ]]; then
    lilypond "${args[@]}" "$src"
  else
    lilypond "${args[@]}" "$src" 2>&1 | grep -E "^(error|warning|Success)" || true
  fi

  local basename
  basename="$(basename "${src%.ly}")"
  if [[ -f "$out_dir/$basename.pdf" ]]; then
    echo "  ✓ $src → $out_dir/$basename.pdf"
    return 0
  else
    echo "  ✗ $src — compilation FAILED" >&2
    return 1
  fi
}

export -f compile_one
export OUTPUT_DIR VERBOSE

# ── Run builds ─────────────────────────────────────────────────────────────
if [[ "$JOBS" -gt 1 ]]; then
  # Use xargs for parallel execution (available on macOS and Linux)
  printf '%s\n' "${SOURCES[@]}" | \
    xargs -P "$JOBS" -I{} bash -c 'compile_one "$@"' _ {} || ERRORS=$?
else
  for src in "${SOURCES[@]}"; do
    compile_one "$src" || ERRORS=$((ERRORS + 1))
  done
fi

# ── Summary ────────────────────────────────────────────────────────────────
echo ""
echo "──────────────────────────────────────────────────"
if [[ "$ERRORS" -eq 0 ]]; then
  echo "✓ All ${#SOURCES[@]} file(s) compiled successfully."
else
  echo "✗ $ERRORS file(s) failed to compile."
  exit 1
fi
