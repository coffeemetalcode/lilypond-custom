%%% custom-commands.ily
%%% Reusable shorthand commands and music functions for LilyPond scores.
%%% Include this file at the top of any .ly file:
%%%   \include "path/to/custom/custom-commands.ily"

%% ──────────────────────────────────────────────────────────────────────────
%% Articulation shorthands
%% ──────────────────────────────────────────────────────────────────────────

%% Snap/Bartok pizzicato
snappizz = \markup {
  \scale #'(1 . 1)
  \translate #'(0 . -0.5)
  \override #'(thickness . 1.5)
  \combine
    \draw-circle #0.6 #0.2 ##f
    \path #0.15
      #'((moveto 0 0)
         (lineto 0 1.5))
}

snapPizzicato = #(define-event-function () ()
  (make-music 'ArticulationEvent
    'articulation-type "snap-pizzicato"
    'tweaks '()))

%% Feathered-beam acceleration / deceleration helpers
accel = \override Beam.grow-direction = #RIGHT
rit   = \override Beam.grow-direction = #LEFT
normBeam = \revert Beam.grow-direction

%% ──────────────────────────────────────────────────────────────────────────
%% Dynamic shorthands
%% ──────────────────────────────────────────────────────────────────────────

%% Parenthesised dynamics, e.g. \pdyn pp
pdyn = #(define-event-function (d) (ly:event?)
  (make-music 'SequentialMusic 'elements
    (list
      (make-music 'TextScriptEvent
        'direction -1
        'text (markup #:normal-text #:italic "("))
      d
      (make-music 'TextScriptEvent
        'direction -1
        'text (markup #:normal-text #:italic ")")))))

%% ──────────────────────────────────────────────────────────────────────────
%% Markup helpers
%% ──────────────────────────────────────────────────────────────────────────

%% Boxed rehearsal mark
boxMark = #(define-music-function (label) (markup?)
  #{
    \mark \markup \box \bold #label
  #})

%% Circle rehearsal mark
circleMark = #(define-music-function (label) (markup?)
  #{
    \mark \markup \circle \bold #label
  #})

%% Italic tempo text
tempoText = #(define-music-function (bpm text) (number? markup?)
  #{
    \tempo \markup { \normal-text \italic #text } = #bpm
  #})

%% ──────────────────────────────────────────────────────────────────────────
%% Note / rhythm helpers
%% ──────────────────────────────────────────────────────────────────────────

%% Forced natural sign (for cautionary naturals after accidentals)
nat = \once \override Accidental.forced = ##t

%% Hidden (invisible) note – keeps spacing without printing
hideNote = {
  \once \override NoteHead.transparent = ##t
  \once \override Stem.transparent = ##t
  \once \override Flag.transparent = ##t
  \once \override Beam.transparent = ##t
  \once \override Accidental.transparent = ##t
  \once \override Dots.transparent = ##t
}

%% Cue-size notes
cueSize = {
  \set fontSize = #-3
  \override Stem.length-fraction = #(magstep -3)
  \override Beam.beam-thickness = #0.35
  \override Beam.length-fraction = #(magstep -3)
}
cueEnd = {
  \unset fontSize
  \revert Stem.length-fraction
  \revert Beam.beam-thickness
  \revert Beam.length-fraction
}

%% ──────────────────────────────────────────────────────────────────────────
%% Staff / system helpers
%% ──────────────────────────────────────────────────────────────────────────

%% Compress full measure rests into a single multi-measure rest symbol
compressFullBarRests = \set Score.skipBars = ##t

%% Expand back to individual measure rests
expandFullBarRests = \set Score.skipBars = ##f

%% Manually break to a new line
lineBreak  = { \break }
pageBreak  = { \pageBreak }
noBreak    = { \noBreak }

%% ──────────────────────────────────────────────────────────────────────────
%% Transposition helpers
%% ──────────────────────────────────────────────────────────────────────────

%% Transpose music up/down by a given interval, keeping concert pitch display
%% Usage: \transposeUp c d { c4 e g }  →  d4 fis a
transposeUp = #(define-music-function (from to music)
    (ly:pitch? ly:pitch? ly:music?)
  (ly:music-transpose music (ly:pitch-diff to from)))

transposeDown = #(define-music-function (from to music)
    (ly:pitch? ly:pitch? ly:music?)
  (ly:music-transpose music (ly:pitch-diff from to)))
