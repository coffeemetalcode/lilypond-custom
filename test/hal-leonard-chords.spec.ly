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

chordsByMusicExpression = \chordmode {
  <c e g d'>1 | <c ef g d'> | c1:3.5.9 | c:3-.5.9 |
}

music = {
  \global
  \chordsByMusicExpression
}

\score {
  \new ChordNames {
    % default Ignatzek chord names
    \mark \markup { \tiny "Default Ignatzek style" }
    \music \break
    % custom Hal Leonard chord names
    \mark \markup { \tiny "Hal Leonard style" }
    \halLeonardChords \music
  }
}
