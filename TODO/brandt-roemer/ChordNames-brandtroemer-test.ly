\version "2.18"

\include "ChordNames-brandtroemer.ly"

\header {
  title = "Brandt & Roemer Chord Names"
}

\paper {
  indent = 0
  ragged-right = ##t
  top-markup-spacing = #'((basic-distance . 8))
  last-bottom-spacing = #'((basic-distance . 8))
  oddHeaderMarkup = ##f
  evenHeaderMarkup = ##f
  tagline = ##f
}

testingGlobal = {
  \time 3/4

  %%%  CHAPTER FOUR: MAJOR CHORDS
      \mark \markup \bold { "Chapter 4: Major Chords" }
      s4*3*3 \break
      s4*3 \break
      s4*3*2 \break
      s4*3*2 \break
      s4*3*3 \break
      s4*3*2 \break

  %%%  CHAPTER FIVE: MINOR CHORDS
      \mark \markup \bold { "Chapter 5: Minor Chords" }
      s4*3*3 \break
      s4*3 \break
      s4*3*3 \break
      s4*3*2 \break
      s4*3*2 \break

  %%%  CHAPTER SIX: DIMINISHED CHORDS
      \mark \markup \bold { "Chapter 6: Diminished Chords" }
      s4*3*2 \break

  %%%  CHAPTER SEVEN: AUGMENTED CHORDS
      \mark \markup \bold { "Chapter 7: Augmented Chords" }
      s4*3*2 \break
      s4*3*2 \break
      s4*3*2 \break
      s4*3*2 \break

  %%%  CHAPTER TEN: COMPOUND CHORDS
      \mark \markup \bold { "Chapter 10: Compound Chords" }
      s4*3
}

testingChords = \chordmode {
  %%%  CHAPTER 4: MAJOR CHORDS
    %%  MAJOR TRIADS
      c4 ees4 fis4
    %%  MAJOR TRIADS WITH ADDED SIXTH
      c4:6 ees4:6 fis4:6
    %%  MAJOR TRIADS WITH ADDED SIXTH & NINTH
      c4:6.9 ees4:6.9 fis4:6.9
    %%  MAJOR TRIADS WITH ADDED NINTH ONLY
      c4:3.5.9 ees4:3.5.9 fis4:3.5.9
    %%  DOMINANT SEVENTHS
      c4:7 ees4:7 fis4:7
    %%  DOMINANT NINTHS
      c4:9 ees4:9 fis4:9
    %%  DOMINANT ELEVENTHS
      c4:11 ees4:11 fis4:11 \bar "|"
      c4:11^3 ees4:11^3 fis4:11^3
    %%  DOMINANT THIRTEENTHS
      c4:13.11 ees4:13.11 fis4:13.11 \bar "|"
      c4:13 ees4:13 fis4:13 \bar "|"
      c4:13^5 ees4:13^5 fis4:13^5
    %%  MAJOR SEVENTHS
      c4:maj7 ees4:maj7 fis4:maj7
    %%  MAJOR NINTHS
      c4:maj9 ees4:maj9 fis4:maj9

  %%%  CHAPTER 5: MINOR CHORDS
    %%  MINOR TRIADS
      c4:m ees4:m fis4:m
    %%  MINOR TRIADS WITH ADDED SIXTH
      c4:m6 ees4:m6 fis4:m6
    %%  MINOR TRIADS WITH ADDED SIXTH & NINTH
      c4:m6.9 ees4:m6.9 fis4:m6.9
    %%  MINOR TRIADS WITH ADDED NINTH ONLY
      c4:m3.5.9 ees4:m3.5.9 fis4:m3.5.9
    %%  MINOR SEVENTHS
      c4:m7 ees4:m7 fis4:m7
    %%  MINOR NINTHS
      c4:m9 ees4:m9 fis4:m9
    %%  MINOR ELEVENTHS
      c4:m11 ees4:m11 fis4:m11
    %%  MINOR THIRTEENTHS
      c4:m13 ees4:m13 fis4:m13  \bar "|"
      c4:m13^11 ees4:m13^11 fis4:m13^11
    %%  MINOR TRIADS WITH A MAJOR SEVENTH
      c4:m3.5.7+ ees4:m3.5.7+ fis4:m3.5.7+
    %%  MINOR NINTHS WITH A MAJOR SEVENTH
      c4:m9.7+ ees4:m9.7+ fis4:m9.7+

  %%%  CHAPTER 6: DIMINISHED CHORDS
    %%  DIMINISHED SEVENTHS
      c4:dim7 ees4:dim7 fis4:dim7
    %%  DIMINISHED TRIADS
      c4:dim ees4:dim fis4:dim

  %%%  CHAPTER 7: AUGMENTED CHORDS
    %%  AUGMENTED TRIADS
      c4:aug ees4:aug fis4:aug  \bar "|"
      c4:3.5+ ees4:3.5+ fis4:3.5+
    %%  AUGMENTED (DOMINANT) SEVENTHS & NINTHS
      c4:aug7 ees4:aug7 fis4:aug7 \bar "|"
      c4:aug9 ees4:aug9 fis4:aug9
    %%  AUGMENTED MAJOR SEVENTHS & NINTHS
      c4:maj7.5+ ees4:maj7.5+ fis4:maj7.5+ \bar "|"
      c4:maj9.5+ ees4:maj9.5+ fis4:maj9.5+
    %%  AUGMENTED MINOR TRIADS & MINOR SEVENTHS
      c4:m3.5+ ees4:m3.5+ fis4:m3.5+ \bar "|"
      c4:m7.5+ ees4:m7.5+ fis4:m7.5+

  %%%  CHAPTER 8: SUSPENSIONS
    %%  SUSPENDED DIMINISHED SEVENTHS

  %%%  CHAPTER 9: CHORDS WITH ALTERED FUNCTIONS
    %%  FLAT FIFTHS
    %%  ALTERED NINTHS
    %%  ALTERED FIFTHS & NINTHS COMBINED
    %%  ALTERED ELEVENTHS

  %%%  CHAPTER 10: COMPOUND CHORDS
      g4:m7/c bes4:m7/ees cis'4:m7/fis

  %%%  CHAPTER 11: POLYTONAL CHORDS

  %%%  CHAPTER 12: MISCELLANY
    %%  FOURTH CHORDS
    %%  OMITTED NOTES
}

\layout {
  \context {
    \Score
    defaultBarType = "||"
    \accidentalStyle forget
    \omit BarNumber
    \override BarLine.space-alist.next-note = #'(fixed-space . 3.0)
    \override RehearsalMark.self-alignment-X = #LEFT
    \override RehearsalMark.padding = #10
    \override RehearsalMark.extra-offset = #'(0 . -5)
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/128)
    \omit Stem
    \omit TimeSignature
  }
  \context {
    \ChordNames
    \override ChordName.font-name = "Minion Pro Semibold"
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1
  }
}

\score {
  <<
    \new ChordNames \testingChords
    \new Staff << \testingGlobal \testingChords >>
  >>
}