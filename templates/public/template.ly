\version "2.24.0"

%%% templates/public/template.ly
%%% Template for publicly released / open-source LilyPond scores.
%%% Copy this file and fill in the sections marked TODO.
%%% The \publicHeader block automatically adds a CC BY 4.0 licence notice.
%%% Change the licenseText variable if you prefer a different open licence.

%% ── Includes ────────────────────────────────────────────────────────────
\include "../../custom/custom-commands.ily"
\include "../../custom/paper-settings.ily"
\include "../../custom/header-templates.ily"
\include "../../custom/engraver-settings.ily"

%% ── Global staff size ───────────────────────────────────────────────────
\staffSizeNormal

%% ── Header variables ────────────────────────────────────────────────────
titleText       = "TODO: Title"
subtitleText    = "TODO: Subtitle (or remove this line)"
composerText    = "TODO: Composer Name"
opusText        = "TODO: Op. X (or remove this line)"
copyrightYear   = "2024"    %% TODO: update year

%% ── Header (includes CC BY 4.0 copyright notice) ────────────────────────
\publicHeader

%% ── Paper ───────────────────────────────────────────────────────────────
\paperA4Portrait

%% ── Music definitions ───────────────────────────────────────────────────

global = {
  \key c \major
  \time 4/4
  \tempo "Andante" 4 = 80
}

%% TODO: Replace the example music with your own.
melody = \relative c' {
  \global
  c4 d e f |
  g4 a b c |
  c4 b a g |
  f4 e d c |
  \bar "|."
}

%% ── Score ───────────────────────────────────────────────────────────────
\score {
  \new Staff {
    \clef treble
    \melody
  }
  \layout { \engraverDefaults }
  \midi { }
}
