\version "2.24.0"

%%% templates/personal/template.ly
%%% Template for personal-use LilyPond scores.
%%% Copy this file and fill in the sections marked TODO.

%% ── Includes ────────────────────────────────────────────────────────────
\include "../../custom/custom-commands.ily"
\include "../../custom/paper-settings.ily"
\include "../../custom/header-templates.ily"
\include "../../custom/engraver-settings.ily"

%% ── Global staff size ───────────────────────────────────────────────────
\staffSizeNormal   %% 17pt — change to \staffSizeSmall or \staffSizeLarge as needed

%% ── Header variables (fill in your details) ─────────────────────────────
titleText       = "TODO: Title"
subtitleText    = "TODO: Subtitle (or remove this line)"
composerText    = "TODO: Composer Name"
opusText        = "TODO: Op. X (or remove this line)"

%% ── Header ──────────────────────────────────────────────────────────────
\personalHeader

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
