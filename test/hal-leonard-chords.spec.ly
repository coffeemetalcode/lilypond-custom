\version "2.24.4"
\language "english"

\include "../custom/custom-settings.ily"

\paper {
  #(set-paper-size "letter")
  top-margin = 0.75\in
  bottom-margin = 1\in
  left-margin = 0.75\in
  right-margin = 0.75\in
  indent = 0\in
}

\header {
  title = "Hal Leonard Chords Test"
  composer = "coffee | metal | code"
  ragged-right = ##f
}

global = {
  \key c \major
  \time 4/4
  \clef treble
}

fromNoteInput = \chordmode {
  \relative c' {
    % triads
    <c e g>4 <c ef g> <c e gs> <c ef gf> |
    % seventh chords
    <c e g bf> <c e g b> <c ef g bf> <c ef gf bff> |
    <c e gs bf> <c ef gf bf> <c ef g b> r | \break
    % sixth chords
    <c e g a> <c e g a d> <c ef g a> r4 |
    % ninth chords
    <c e g bf d>4 <c e g b d> <c ef g bf d> r |
    % eleventh chords
    <c e g bf d f> <c e g b d f> <c ef g bf d f> r | \break
    % thirteenth chords
    <c e g bf d a'> <c e g bf d f a> <c e g b d f a> <c ef g bf d f a> |
    % suspended and fifth (power) chords
    <c d g> <c f g> <c g'> <c g' c> |
    % add chords
    <c e g d'> <c ef g d'> r2 | \break
    % from Harmonic Analysis Chapter of Hal Leonard style guide
    \mark \markup \small "Harmonic Analysis chapter"
    % Cm7b9#5 | C7b9#5 | Cadd4 | C13sus4 |
    <c ef gs bf df>4 <c e gs bf df> <c e f g> <c f g bf d f a>  |
    % C7sus4 | C(b9)#11 | Cm(add4) | C13#9
    <c f g bf> <c e g bf df fs> <c ef f g> <c e g bf ds f a> |
    % C7b5 | Cm6/9 | C13b9 | C7b9 |
    <c e gf bf> <c ef g a d> <c e g bf df f a> <c e g bf df> |
    % C7#11 | Csu2/add11 | C7#9 | C9#11 |
    <c e g bf d fs> <c d g f'> <c e g bf ds> <c e g bf d af'> |
    % Csus2/4 |
    <c d f> r2. |
  }
}

fromChordModifierInput = \chordmode {
  % triads
  c4 c:m c:aug c:dim |
  % seventh chords
  c:7 c:maj7 c:m7 c:dim7 |
  c:aug7 c:m7.5- c:m7+ r | \break
  % sixth chords
  c:6 c:6.9 c:m6 r4 |
  % ninth chords
  c4:9 c:maj9 c:m9 r |
  % eleventh chords
  c:11 c:maj11 c:m11 r | \break
  % thirteenth chords
  c:9.13 c:13.11 c:maj13.11 c:m13 |
  % suspended and fifth (power) chords
  c:sus2 c:sus4 c:5 c:5.8 |
  % add chords
  c:3.5.9 c:3-.5.9 r2 | \break
  % from Harmonic Analysis Chapter of Hal Leonard style guide
  \mark \markup \small "Harmonic Analysis chapter"
  % Cm7b9#5 | C7b9#5 | Cadd4 | C13sus4 |
  c4:m7.5+.9- c:7.5+.9- c:3.4.5 c:sus4.7.9.11.13 |
  % C7sus4 | C(b9)#11 | Cm(add4) | C13#9
  c:7sus4 c:7.9-.11+ c:5.3-.4 c:13.11.9+ |
  % C7b5 | Cm6/9 | C13b9 | C7b9 |
  c:7.5- c:m6.9 c:13.11.9- c:7.9- |
  % C7#11 | Csus2/add11 | C7#9 | C9#11 |
  c:9.11+ c:sus2.11 c:7.9+ c:9.11+ |
  % Csus2/4 |
  c:2.4^3.5 r2. |
}

\score {
  <<
    \new ChordNames {
      \global
      % \centerChordSymbols
      \mark \markup {
        \column {
          \small { "Default Ignatzek style" }
          \small { "from note input:" }
        }
      }
      \fromNoteInput
      \mark \markup { \small "from chord modifier input:" }
      \fromChordModifierInput
      \mark \markup {
        \column {
          \small { "Hal Leonard style" }
          \small { "from note input:" }
        }
      }
      \halLeonardChords \fromNoteInput
      \mark \markup { \small "from chord modifier input:" }
      \fromChordModifierInput
    }
    \new Staff {
      \global
      \fromNoteInput \fromChordModifierInput
      \fromNoteInput \fromChordModifierInput
    }
  >>
  \layout {
    \context {
      \ChordNames
      \hlSerifFont
    }
  }
}
