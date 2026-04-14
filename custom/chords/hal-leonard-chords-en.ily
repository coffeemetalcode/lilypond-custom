%%% hal-leonard-chords-en.ily
\language "english"

%% Helper Commands
alterSharp = \markup { \fontsize #-2.5 \translate-scaled #'(0 . 1.0) \sharp }
alterFlat = \markup { \fontsize #-2.5 \translate-scaled #'(0 . 0.5) \flat }

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
   \raise #0.9
   \fontsize #-3
   \override #'(baseline-skip . 1)
   \left-column {
     \raise #0.35 #top
     \lower #0.15 #bottom
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
   \raise #1
   \fontsize #-3.25
   \override #'(baseline-skip . 1)
   \center-column {
     \raise #0.35 #top
     \lower #0.15 #bottom
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
  % + c1:aug
  <c e gs>1-\markup { "+" }
  % ° c1:dim
  <c ef gf>1-\markup { "°" }
  % 6 c1:6
  <c e g a>1-\markup { "6" }
  % m6 c1:m6
  <c ef g a>1-\markup { "m6" }
  % 9 c1:9
  <c e g bf d'>1-\markup { "9" }
  % maj9 c1:maj9
  <c e g b d'>1-\markup { "maj9" }
  % m9 c1:m9
  <c ef g bf d'>1-\markup { "m9" }
  % 11 c1:11
  <c e g bf d' f'>1-\markup { "11" }
  % maj11 c1:maj11
  <c e g b d' f'>1-\markup { "maj11" }
  % m11 c1:m11
  <c ef g bf d' f'>1-\markup { "m11" }
  % 13add9 c1:13, c1:13.9
  <c e g bf d' a'>1-\markup { "13add9" }
  % 13 c1:13.11
  <c e g bf d' f' a'>1-\markup { "13" }
  % maj13 c1:maj13.11
  <c e g b d' f' a'>1-\markup { "maj13" }
  % m13 c1:m13.11
  <c ef g bf d' f' a'>1-\markup { "m13" }
  % add9 c1:3.5.9
  <c e g d'>1-\markup { "add9" }
  % m(add9) c:3-.5.9
  <c ef g d'>1-\markup { "m(add9)" }
  % 7#5 c1:aug7
  <c e gs bf>1-\markup {
    \concat { "7" \alterSharp "5" }
  }
  % m7 c1:m7
  <c ef g bf>1-\markup { "m7" }
  % °7 c1:dim7
  <c ef gf bff>1-\markup { "°7" }
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
  % sus2 c1:sus2
  <c d g>1-\markup { "sus2" }
  % sus4 c1:sus4
  <c f g>1-\markup { "sus4" }
  % 5 c1:1.5
  <c g>1-\markup { "5" }
  % 5 c1:1.5.8
  <c g c'>1-\markup { "5" }

  %% From Harmonic Analysis chapter in the Hal Leonard style guide
  % m7b9#5
  <c ef gs bf df'>1-\markup {
    \concat {
      "m7"
      \stacked-alteration \alterFlat \alterSharp
      \stacked-suffix "9" "5"
      % \stacked-suffix \concat { \alterFlat "9" } \concat { \alterSharp "5" }
    }
  }
  % 7b9#5
  <c e gs bf df'>1-\markup {
    \concat {
      "7"
      \stacked-alteration \alterFlat \alterSharp
      \stacked-suffix "9" "5"
      % \stacked-suffix \concat { \alterFlat "9" } \concat { \alterSharp "5" }
    }
  }
  % add4
  <c e f g>1-\markup { "add4" }
  % 13sus4
  <c f g bf d' f' a'>1-\markup { "13sus4" }
  % 7sus4
  <c f g bf>1-\markup { "7sus4" }
  % (b9)#11
  <c e g bf df' fs'>1-\markup {
    \concat {
      "(" \alterFlat "9)" \alterSharp "11"
    }
  }
  % m(add4)
  <c ef f g>1-\markup { "m(add4)" }
  % 13#9
  <c e g bf ds' f' a'>1-\markup {
    \concat { "13" \alterSharp "9" }
  }
  % 7b5
  <c e gf bf>1-\markup {
    \concat { "7" \alterFlat "5" }
  }
  % m6/9
  <c ef g a d'>1-\markup {
    \concat { "m" \stacked-suffix "6" "9" }
  }
  % 13b9
  <c e g bf df' f' a'>1-\markup {
    \concat { "13" \alterFlat "9" }
  }
  % 7b9
  <c e g bf df'>1-\markup {
    \concat { "7" \alterFlat "9" }
  }
  % 7#11
  <c e g bf d' fs'>1-\markup {
    \concat { "7" \alterSharp "11" }
  }
  % sus2/add11
  <c d g f'>1-\markup {
    % \concat { \stacked-suffix "sus2" "add11" }
    \stacked-suffix "sus2" "add11"
  }
  % 7#9
  <c e g bf ds'>1-\markup {
    \concat { "7" \alterSharp "9" }
  }
  % 9#11
  <c e g bf d' af'>1-\markup {
    \concat { "9" \alterSharp "11" }
  }
  % sus2/4
  <c d f>1-\markup {
    \concat { "sus" \stacked-suffix "2" "4" }
  }
}

hlChords = #(append
             (sequential-music-to-chord-exceptions hlChordCustomizations #t)
             ignatzekExceptions)

hlSerifFont =  \override ChordName.font-name = "Times LT Std, Times New Roman, DejaVu Serif, serif"
hlSansFont = \override ChordName.font-name = "Helvetica LT Std, Arial, DejaVu Sans, sans-serif"
