%%% paper-settings.ily
%%% Paper size and margin presets for common publishing scenarios.
%%% Include this file inside a \paper { } block or at score level:
%%%   \include "path/to/custom/paper-settings.ily"
%%%
%%% Then activate a preset by calling one of the functions below inside
%%% your \paper { } block, e.g.:
%%%
%%%   \paper {
%%%     \paperA4Portrait
%%%   }

%% ──────────────────────────────────────────────────────────────────────────
%% Helper: convert millimetres to LilyPond internal units (points * scale)
%% ──────────────────────────────────────────────────────────────────────────
#(define (mm->ly mm) (* mm (/ 72 25.4)))

%% ──────────────────────────────────────────────────────────────────────────
%% A4 presets
%% ──────────────────────────────────────────────────────────────────────────

paperA4Portrait = \paper {
  #(set-paper-size "a4")
  top-margin    = 15\mm
  bottom-margin = 15\mm
  left-margin   = 20\mm
  right-margin  = 20\mm
  indent        = 15\mm
  short-indent  = 10\mm
}

paperA4Landscape = \paper {
  #(set-paper-size "a4" 'landscape)
  top-margin    = 12\mm
  bottom-margin = 12\mm
  left-margin   = 15\mm
  right-margin  = 15\mm
  indent        = 12\mm
  short-indent  = 8\mm
}

%% A4 with extra room in the inner margin for binding (left-side binding)
paperA4Bound = \paper {
  #(set-paper-size "a4")
  top-margin    = 15\mm
  bottom-margin = 15\mm
  left-margin   = 28\mm
  right-margin  = 15\mm
  indent        = 15\mm
  short-indent  = 10\mm
}

%% ──────────────────────────────────────────────────────────────────────────
%% US Letter presets
%% ──────────────────────────────────────────────────────────────────────────

paperLetterPortrait = \paper {
  #(set-paper-size "letter")
  top-margin    = 15\mm
  bottom-margin = 15\mm
  left-margin   = 20\mm
  right-margin  = 20\mm
  indent        = 15\mm
  short-indent  = 10\mm
}

paperLetterLandscape = \paper {
  #(set-paper-size "letter" 'landscape)
  top-margin    = 12\mm
  bottom-margin = 12\mm
  left-margin   = 15\mm
  right-margin  = 15\mm
  indent        = 12\mm
  short-indent  = 8\mm
}

%% ──────────────────────────────────────────────────────────────────────────
%% B5 (common for printed music books)
%% ──────────────────────────────────────────────────────────────────────────

paperB5 = \paper {
  #(set-paper-size "b5")
  top-margin    = 12\mm
  bottom-margin = 12\mm
  left-margin   = 16\mm
  right-margin  = 14\mm
  indent        = 12\mm
  short-indent  = 8\mm
}

paperB5Bound = \paper {
  #(set-paper-size "b5")
  top-margin    = 12\mm
  bottom-margin = 12\mm
  left-margin   = 22\mm
  right-margin  = 12\mm
  indent        = 12\mm
  short-indent  = 8\mm
}

%% ──────────────────────────────────────────────────────────────────────────
%% Score / global-staff-size helpers
%% ──────────────────────────────────────────────────────────────────────────

%% Standard sizes (call OUTSIDE \paper, at the top of your .ly file)
staffSizeSmall  = #(set-global-staff-size 14)   %% parts / choir
staffSizeNormal = #(set-global-staff-size 17)   %% typical score
staffSizeLarge  = #(set-global-staff-size 20)   %% conductor / large print

%% ──────────────────────────────────────────────────────────────────────────
%% Spacing tweaks
%% ──────────────────────────────────────────────────────────────────────────

%% Tight spacing: useful for dense orchestral scores
spacingTight = \layout {
  \context {
    \Score
    \override NonMusicalPaperColumn.padding = #0.5
    \override PaperColumn.padding = #0.3
    proportionalNotationDuration = #(ly:make-moment 1 32)
  }
}

%% Loose spacing: useful for educational / beginner materials
spacingLoose = \layout {
  \context {
    \Score
    \override NonMusicalPaperColumn.padding = #1.5
    \override PaperColumn.padding = #0.8
  }
}
