#!/usr/bin/env bash
# scripts/new-score.sh
# Scaffold a new LilyPond score from one of the project templates.
#
# Usage:
#   ./scripts/new-score.sh personal  my-piece
#   ./scripts/new-score.sh public    my-sonata   scores/
#   ./scripts/new-score.sh commercial "Suite Op.5" commercial-works/
#
# Arguments:
#   <type>       Template type: personal | public | commercial
#   <name>       Name of the new score (used as the file/directory name)
#   [dest-dir]   Destination directory (default: current directory)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES_DIR="$REPO_ROOT/templates"

print_usage() {
  cat <<EOF
Usage: $(basename "$0") <type> <name> [dest-dir]

  type      : personal | public | commercial
  name      : score name (used as folder and file name; spaces become dashes)
  dest-dir  : where to create the score folder (default: current directory)

Examples:
  $(basename "$0") personal "My Nocturne"
  $(basename "$0") public   "Sonata No. 1"   ./scores
  $(basename "$0") commercial "Suite Op. 5"  ./commercial-works
EOF
}

if [[ $# -lt 2 ]]; then
  print_usage
  exit 1
fi

TYPE="$1"
NAME="$2"
DEST_DIR="${3:-.}"

# Validate template type
TEMPLATE_SRC="$TEMPLATES_DIR/$TYPE/template.ly"
if [[ ! -f "$TEMPLATE_SRC" ]]; then
  echo "Error: unknown template type '$TYPE'." >&2
  echo "Available types: personal, public, commercial" >&2
  exit 1
fi

# Sanitise name → safe directory/file name
SAFE_NAME="$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//;s/-$//')"

TARGET_DIR="$DEST_DIR/$SAFE_NAME"
TARGET_FILE="$TARGET_DIR/$SAFE_NAME.ly"

if [[ -d "$TARGET_DIR" ]]; then
  echo "Error: directory already exists: $TARGET_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

# Copy template and replace TODO title with the actual name
sed "s/TODO: Title/$NAME/" "$TEMPLATE_SRC" > "$TARGET_FILE"

# Update the relative include paths to point to the repo's custom/ directory
INCLUDE_PATH="$(realpath --relative-to="$TARGET_DIR" "$REPO_ROOT/custom")"
sed -i "s|../../custom|$INCLUDE_PATH|g" "$TARGET_FILE"

echo "✓ Created: $TARGET_FILE"
echo ""
echo "Next steps:"
echo "  1. Edit $TARGET_FILE and fill in the TODO fields."
echo "  2. Run: ./scripts/build.sh $TARGET_FILE"
