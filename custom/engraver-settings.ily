%%% engraver-settings.ily
%%% Common layout and engraver tweaks that improve engraving quality.
%%% Include at the top level of your .ly file or inside a \layout { } block.
%%%
%%% Example:
%%%   \layout {
%%%     \engraverDefaults
%%%   }

%% ──────────────────────────────────────────────────────────────────────────
%% Sensible defaults for most projects
%% ──────────────────────────────────────────────────────────────────────────

engraverDefaults = \layout {
  \context {
    \Score

    %% Avoid collisions between dynamics and the staff below
    \override DynamicLineSpanner.staff-padding = #3

    %% Keep slurs clear of dynamics
    \override Slur.outside-staff-priority = #500

    %% Slightly more space between systems
    \override StaffGrouper.staff-staff-spacing.basic-distance = #10

    %% Tighter beam slope for short beams
    \override Beam.auto-knee-gap = #5.5

    %% More natural bar-number placement
    \override BarNumber.break-visibility = #all-invisible
    \override BarNumber.self-alignment-X = #LEFT
  }
  \context {
    \Staff
    %% Invisible ledger lines on empty staves in full scores
    \override StaffSymbol.color = #black
  }
  \context {
    \Voice
    %% Consistent stem length
    \override Stem.length-fraction = #1.0
  }
}

%% ──────────────────────────────────────────────────────────────────────────
%% Orchestra/full score – remove instrument names after the first system
%% ──────────────────────────────────────────────────────────────────────────

orchestraLayout = \layout {
  indent      = 20\mm
  short-indent = 12\mm
  \context {
    \Score
    \override SystemStartBar.collapse-height = #1
  }
  \context {
    \Staff
    \override InstrumentName.font-series = #'bold
    \override InstrumentName.font-size   = #-1
  }
}

%% ──────────────────────────────────────────────────────────────────────────
%% Chamber music – no indent, bracket instead of brace for staff group
%% ──────────────────────────────────────────────────────────────────────────

chamberLayout = \layout {
  indent       = 0\mm
  short-indent = 0\mm
  \context {
    \StaffGroup
    systemStartDelimiter = #'SystemStartBracket
  }
}

%% ──────────────────────────────────────────────────────────────────────────
%% Piano layout – grand staff brace, no redundant instrument name
%% ──────────────────────────────────────────────────────────────────────────

pianoLayout = \layout {
  indent      = 15\mm
  short-indent = 10\mm
  \context {
    \PianoStaff
    systemStartDelimiter = #'SystemStartBrace
    \override SystemStartBrace.font-size = #2
  }
}

%% ──────────────────────────────────────────────────────────────────────────
%% Choral / vocal score – standard four-part layout
%% ──────────────────────────────────────────────────────────────────────────

choralLayout = \layout {
  indent      = 15\mm
  short-indent = 10\mm
  \context {
    \ChoirStaff
    systemStartDelimiter = #'SystemStartBracket
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"  %% Remove redundant time signatures
  }
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 16)
  }
}

%% ──────────────────────────────────────────────────────────────────────────
%% Fake notes (for lead sheets / chord charts) – noteheads only, no stems
%% ──────────────────────────────────────────────────────────────────────────

chordsOnlyLayout = \layout {
  \context {
    \Voice
    \remove "Stem_engraver"
    \remove "Beam_engraver"
    \remove "Flag_engraver"
    \override NoteHead.duration-log = #2
  }
}
