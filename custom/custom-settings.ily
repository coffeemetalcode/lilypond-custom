%%% custom-settings.ily
%%% Custom settings for reuse and portability
%%% Include with `\include "custom-settings.ily"`
%%% Invoke individual commands where appropriate (see docstrings)

\include "chords/hal-leonard-chords-en.ily"
\include "chords/jazz-chords-en.ily"

%% ──────────────────────────────────────────────────────────────────────────
%% Chords
%% ──────────────────────────────────────────────────────────────────────────

%%%% ────────────────────────────────────────────────────────────────────────
%%%% Center Chord Symbols
%%%% ────────────────────────────────────────────────────────────────────────

% Center chord symbols horizontally on the notehead
% Notehead width is approximately 1.3 staff-spaces

%{
{
  \chordmode { d1:7- | g:7 | c:maj7 | f:maj7 | b:m7.5- | e:7 | a:m7 }
  \centerChordSymbols
  \chordmode { d1:7- | g:7 | c:maj7 | f:maj7 | b:m7.5- | e:7 | a:m7 }
}
%}

% TODO: This value should be derived, or at the least, passed to the function
% as CDR from an alist where the different fonts are given actual values for
% the different notehead glyphs
% TODO: Note spacing doesn't shift left with the chord symbol and is very
% noticeable in long chord symbols
#(define notehead-center 0.65)
centerChordSymbols = {
  \override ChordName.after-line-breaking =
  #(lambda (grob)
    (let* ((stil (ly:grob-property grob 'stencil)))
     (if (ly:stencil? stil)
      (let* ((ext (ly:stencil-extent stil X))
             (width (interval-length ext))
             (shift (- notehead-center (/ width 2.0))))
       (ly:grob-set-property! grob 'stencil
        (ly:stencil-translate-axis stil shift X))))))
}

% TODO: A similar function that centers only the chord root on the notehead

%%%% ────────────────────────────────────────────────────────────────────────
%%%% Hal Leonard Chord Symbols
%%%% ────────────────────────────────────────────────────────────────────────

% Use Hal Leonard chord naming conventions as in their popular
% Guitar Recorded Versions® (GRV) songbooks and other formats

%{
{
  \chordmode { d1:7- | g:7 | c:maj7 | f:maj7 | b:m7.5- | e:7 | a:m7 }
  \halLeonardChords
  \chordmode { d1:7- | g:7 | c:maj7 | f:maj7 | b:m7.5- | e:7 | a:m7 }
}
%}

halLeonardChords = \set chordNameExceptions = #hlChords
