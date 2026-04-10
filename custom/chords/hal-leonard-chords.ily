%%% hal-leonard-chords-en.ily
\language "english"

hlChordCustomizations = {
  % add9 c1:3.5.9
  <c e g d'>1-\markup { \small "add9" }
  % m(add9) c:3-.5.9
  <c ef g d'>1-\markup { \small "m(add9)" }
}

%% \set chordNameExceptions = #customizations
hlChords = #(append
             (sequential-music-to-chord-exceptions hlChordCustomizations #t)
             ignatzekExceptions)
