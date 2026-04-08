# lilypond-custom

Custom commands, scripts, and settings for personal, public, and commercial
[LilyPond](https://lilypond.org) publishing projects.

---

## Contents

```
lilypond-custom/
├── custom/                     # Reusable LilyPond include files (.ily)
│   ├── custom-commands.ily     # Shorthand music functions and helpers
│   ├── paper-settings.ily      # Paper size and margin presets
│   ├── header-templates.ily    # Header presets (personal / public / commercial)
│   └── engraver-settings.ily   # Layout and engraver tweaks
├── templates/                  # Ready-to-copy score templates
│   ├── personal/template.ly    # For personal drafts and studies
│   ├── public/template.ly      # For openly licensed publications (CC BY 4.0)
│   └── commercial/template.ly  # For commercially published scores
└── scripts/
    ├── build.sh                # Compile a single .ly file
    ├── batch-build.sh          # Compile all .ly files in a directory tree
    └── new-score.sh            # Scaffold a new score from a template
```

---

## Quick start

### 1. Create a new score

```bash
./scripts/new-score.sh personal "My Nocturne"
# creates my-nocturne/my-nocturne.ly pre-filled from the personal template
```

Available template types: `personal`, `public`, `commercial`.

### 2. Compile to PDF

```bash
./scripts/build.sh my-nocturne/my-nocturne.ly
```

Output is written next to the source file by default. Use `-o <dir>` to redirect:

```bash
./scripts/build.sh -o build/ my-nocturne/my-nocturne.ly
```

### 3. Batch compile

```bash
./scripts/batch-build.sh scores/          # compile every .ly under scores/
./scripts/batch-build.sh -o build/ .      # compile everything, output to build/
./scripts/batch-build.sh -j 4 scores/     # parallel (4 jobs)
```

---

## Using the include files directly

Add any of the files from `custom/` to your own LilyPond score:

```lilypond
\version "2.24.0"
\include "path/to/custom/custom-commands.ily"
\include "path/to/custom/paper-settings.ily"
\include "path/to/custom/header-templates.ily"
\include "path/to/custom/engraver-settings.ily"

% Set header variables
titleText     = "Prelude"
composerText  = "Jane Doe"
copyrightYear = "2024"

\personalHeader   % or \publicHeader / \commercialHeader

\paperA4Portrait

\score {
  \new Staff { c'4 d' e' f' \bar "|." }
  \layout { \engraverDefaults }
  \midi { }
}
```

---

## Include file reference

### `custom-commands.ily`

| Command / Variable | Description |
|--------------------|-------------|
| `\snappizz` | Snap/Bartok pizzicato markup |
| `\accel` / `\rit` / `\normBeam` | Feathered-beam direction helpers |
| `\pdyn <dynamic>` | Parenthesised dynamic, e.g. `\pdyn \pp` |
| `\boxMark <label>` | Boxed rehearsal mark |
| `\circleMark <label>` | Circled rehearsal mark |
| `\tempoText <bpm> <text>` | Italic tempo marking with metronome |
| `\nat` | Forced natural sign (cautionary) |
| `\hideNote` | Make a note invisible (keeps spacing) |
| `\cueSize` / `\cueEnd` | Switch to/from cue-note size |
| `\compressFullBarRests` | Show multi-measure rests as single symbol |
| `\lineBreak` / `\pageBreak` / `\noBreak` | Manual system/page breaks |

### `paper-settings.ily`

| Variable | Description |
|----------|-------------|
| `\paperA4Portrait` | A4, portrait, standard margins |
| `\paperA4Landscape` | A4, landscape |
| `\paperA4Bound` | A4, portrait, extra left margin for binding |
| `\paperLetterPortrait` | US Letter, portrait |
| `\paperLetterLandscape` | US Letter, landscape |
| `\paperB5` | B5 (common for printed music) |
| `\paperB5Bound` | B5 with extra inner margin for binding |
| `\staffSizeSmall` | 14 pt staff size (parts, choir) |
| `\staffSizeNormal` | 17 pt staff size (typical score) |
| `\staffSizeLarge` | 20 pt staff size (conductor / large print) |
| `\spacingTight` | Dense proportional spacing |
| `\spacingLoose` | Generous spacing (educational materials) |

### `header-templates.ily`

Set the variables listed below **before** calling a header command:

| Variable | Default | Notes |
|----------|---------|-------|
| `titleText` | `"Untitled"` | Score title |
| `subtitleText` | `""` | Subtitle |
| `composerText` | `""` | Composer name |
| `lyricistText` | `""` | Lyricist name |
| `arrangerText` | `""` | Arranger name |
| `dedicationText` | `""` | Dedication |
| `opusText` | `""` | Opus / catalogue number |
| `instrumentText` | `""` | Instrument name |
| `copyrightYear` | `"2024"` | Year for copyright notice |
| `copyrightOwner` | `""` | Rights holder (commercial only) |
| `publisherText` | `""` | Publisher info (commercial only) |
| `taglineText` | `##f` | Set to `##f` to suppress LilyPond tagline |

| Header command | Use case |
|----------------|----------|
| `\personalHeader` | Personal / private scores — no copyright notice |
| `\publicHeader` | Publicly released scores — adds CC BY 4.0 notice |
| `\commercialHeader` | Commercial scores — adds All Rights Reserved notice |

### `engraver-settings.ily`

| Variable | Description |
|----------|-------------|
| `\engraverDefaults` | Sensible tweaks for most projects |
| `\orchestraLayout` | Full score with instrument name indentation |
| `\chamberLayout` | No indent, bracket for staff groups |
| `\pianoLayout` | Grand staff brace, no redundant instrument name |
| `\choralLayout` | Four-part SATB layout |
| `\chordsOnlyLayout` | Noteheads only, no stems (lead sheets) |

---

## Scripts reference

### `scripts/build.sh`

```
Usage: build.sh [OPTIONS] <score.ly>

Options:
  -o <dir>   Output directory (default: same as input file)
  -n         Suppress MIDI output
  -v         Verbose: show full LilyPond log
  -h         Show help
```

### `scripts/batch-build.sh`

```
Usage: batch-build.sh [OPTIONS] [search-dir]

Options:
  -o <dir>   Common output directory for all PDFs
  -j <n>     Number of parallel compile jobs (default: 1)
  -v         Verbose output
  -h         Show help
```

### `scripts/new-score.sh`

```
Usage: new-score.sh <type> <name> [dest-dir]

  type     : personal | public | commercial
  name     : score name (spaces become dashes in the filename)
  dest-dir : destination directory (default: current directory)
```

---

## Requirements

- [LilyPond](https://lilypond.org/download.html) 2.24 or later
- Bash 4+ (for the scripts)

---

## Licence

This repository is released under the [GNU General Public License v3.0](LICENSE).
You are free to use, modify, and redistribute these files in your own projects.
