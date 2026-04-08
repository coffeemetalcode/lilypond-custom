\version "2.24.0"

%%% templates/commercial/template.ly
%%% Template for commercial LilyPond scores (all rights reserved).
%%% Copy this file and fill in the sections marked TODO.
%%% The \commercialHeader block adds an "All Rights Reserved" copyright
%%% notice and a reminder about unauthorised copying.

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
arrangerText    = "TODO: Arranged by (or remove this line)"
opusText        = "TODO: Catalogue number (or remove this line)"
copyrightYear   = "2024"            %% TODO: update year
copyrightOwner  = "TODO: Publisher / Rights Holder Name"
publisherText   = "TODO: Publisher Name, City — www.example.com"

%% ── Header (includes All Rights Reserved copyright notice) ──────────────
\commercialHeader

%% ── Paper ───────────────────────────────────────────────────────────────
%% B5 with a wider inner margin for print-ready binding
\paperB5Bound

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
