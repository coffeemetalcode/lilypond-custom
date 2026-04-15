\version "2.18.2"

\include "new_bend.ly"

\include "english.ly"


examples = \relative c' {
  \bendOn
  e4\3 e8\3( fs\3 )( e4\3 ) r |
  e4\3( f!\3 )( e2\3 ) |
}

\score {
  <<
    \new Staff \with {
      \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 15.5))
    } {
      \override Staff.StringNumber.stencil = ##f
      \clef "G_8"
      \new Voice {
        \examples
      }
    }
    \new TabVoice {
      \examples
    }
  >>
}