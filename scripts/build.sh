#!/usr/bin/env bash
# scripts/build.sh
# Compile a single LilyPond source file to PDF (and optionally MIDI).
#
# Usage:
#   ./scripts/build.sh path/to/score.ly
#   ./scripts/build.sh -o output/dir path/to/score.ly
#
# Requirements: lilypond must be available on PATH.

set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────────
OUTPUT_DIR=""
VERBOSE=false
MIDI=true

# ── Parse arguments ────────────────────────────────────────────────────────
print_usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] <score.ly>

Options:
  -o <dir>    Output directory for generated files (default: same as input)
  -n          Suppress MIDI output (pass --no-midi to LilyPond)
  -v          Verbose: show full LilyPond log
  -h          Show this help message
EOF
}

while getopts "o:nvh" opt; do
  case "$opt" in
    o) OUTPUT_DIR="$OPTARG" ;;
    n) MIDI=false ;;
    v) VERBOSE=true ;;
    h) print_usage; exit 0 ;;
    *) print_usage; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

if [[ $# -lt 1 ]]; then
  echo "Error: no input file specified." >&2
  print_usage
  exit 1
fi

INPUT_FILE="$1"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: file not found: $INPUT_FILE" >&2
  exit 1
fi

# ── Determine output directory ─────────────────────────────────────────────
if [[ -z "$OUTPUT_DIR" ]]; then
  OUTPUT_DIR="$(dirname "$INPUT_FILE")"
fi
mkdir -p "$OUTPUT_DIR"

# ── Check for LilyPond ────────────────────────────────────────────────────
if ! command -v lilypond &>/dev/null; then
  echo "Error: 'lilypond' not found on PATH." >&2
  echo "Download LilyPond from https://lilypond.org/download.html" >&2
  exit 1
fi

# ── Build arguments ────────────────────────────────────────────────────────
LILY_ARGS=("--output=$OUTPUT_DIR")
if [[ "$MIDI" == false ]]; then
  LILY_ARGS+=("--no-midi")
fi

# ── Compile ───────────────────────────────────────────────────────────────
echo "→ Compiling: $INPUT_FILE"
echo "→ Output to: $OUTPUT_DIR"

if [[ "$VERBOSE" == true ]]; then
  lilypond "${LILY_ARGS[@]}" "$INPUT_FILE"
else
  lilypond "${LILY_ARGS[@]}" "$INPUT_FILE" 2>&1 | grep -E "^(error|warning|Success)" || true
fi

BASENAME="$(basename "${INPUT_FILE%.ly}")"
PDF="$OUTPUT_DIR/$BASENAME.pdf"

if [[ -f "$PDF" ]]; then
  echo "✓ PDF created: $PDF"
else
  echo "✗ PDF not found – check for errors above." >&2
  exit 1
fi
