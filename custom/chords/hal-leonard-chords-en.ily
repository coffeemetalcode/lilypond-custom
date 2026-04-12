%%% hal-leonard-chords-en.ily
\language "english"

%% Helper Commands
alterSharp = \markup { \raise #0.75 \fontsize #-2.5 \sharp }
alterFlat = \markup { \raise #0.45 \fontsize #-2.5 \flat }

%% Stacked suffix markup command
%% Usage: \markup { \stacked-suffix "top" "bottom" }
%% or:   \markup { \stacked-suffix \concat { \alterSharp "11" } "add9" }
#(define-markup-command (stacked-suffix layout props top bottom)
  (markup? markup?)
  #:properties ((font-size 0))
  "Stack two suffix elements vertically, centered on the chord root baseline."
  (interpret-markup layout props
   #{
   \markup {
   \raise #0.75
   \fontsize #-3
   \override #'(baseline-skip . 1)
   \center-column {
     \raise #0.3 #top
     \lower #0.1 #bottom
   }
 }
   #}))

#(define-markup-command (stacked-alteration layout props top bottom)
  (markup? markup?)
  #:properties ((font-size 0))
  "Stack two accidentals for chord alterations"
  (interpret-markup layout props
   #{
   \markup {
   \raise #0.75
   \fontsize #-3
   \override #'(baseline-skip . 1)
   \center-column {
     \raise #0.1 #top
     \lower #0.1 #bottom
   }
 }
   #}))

   %% Helper for altered intervals (e.g., #11, b9)
#(define-markup-command (altered-interval layout props alteration interval)
  (markup? string?)
  #:properties ((font-size 0))
  "Create an altered interval like #11 or b9."
  (interpret-markup layout props
   #{
   \markup {
   \concat { #alteration #interval }
 }
   #}))


hlChordCustomizations = {
  % add9 c1:3.5.9
  <c e g d'>1-\markup { "add9" }
  % m(add9) c:3-.5.9
  <c ef g d'>1-\markup { "m(add9)" }
  % 7#5 c1:aug7
  <c e gs bf>1-\markup {
    \concat { "7" \alterSharp "5" }
  }
  % m7b5 c1:m7.5-
  <c ef gf bf>1-\markup {
    \concat { "m7" \alterFlat "5" }
  }
  % m(maj7) c:m7+
  <c ef g b>1-\markup { "m(maj7)" }
  % 7 c1:7
  <c e g bf>1-\markup { "7" }
  % maj7 c1:maj7
  <c e g b>1-\markup { "maj7" }
  % 6/9 c1:6.9
  <c e g a d'>1-\markup { \stacked-suffix "6" "9" }
  % 5 c1:1.5
  <c g>1-\markup { "5" }
  % 5 c1:1.5.8
  <c g c'>1-\markup { "5" }
}

\layout {
  \context {
    \ChordNames
    \override ChordName.font-size = #-0.5
    \override ChordName.font-name = #"Times LT Std"
    % \override ChordName.font-family = #'serif
  }
}

hlChords = #(append
             (sequential-music-to-chord-exceptions hlChordCustomizations #t)
             ignatzekExceptions)
