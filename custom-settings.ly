notesetterTies = {
  \override Score.Tie #'line-thickness = #0.6
  \override Score.Tie #'thickness = #1.5
  \override Score.Tie #'minimum-length = #3.75
  \override Score.Tie #'details = #'(
  (ratio . 0.333)
  (center-staff-line-clearance . 0.6)
  (tip-staff-line-clearance . 0.0)
  (note-head-gap . 0.3)
  (stem-gap . 0.35)
  (height-limit . 1.25)
  (horizontal-distance-penalty-factor . 10)
  (same-dir-as-stem-penalty . 8)
  (min-length-penalty-factor . 26)
  (tie-tie-collision-distance . 0.45)
  (tie-tie-collision-penalty . 25.0)
  (intra-space-threshold . 1.25)
  (outer-tie-vertical-distance-symmetry-penalty-factor . 0.0)
  (outer-tie-length-symmetry-penalty-factor . 0.0)
  (vertical-distance-penalty-factor . 7.0)
  (outer-tie-vertical-gap . 0.0)
  (multi-tie-region-size . 3)
  (single-tie-region-size . 4)
  (between-length-limit . 1)
  )
}

notesetterGliss = {
  \override Score.Glissando #'springs-and-rods = #ly:spanner::set-spacing-rods
  \override Score.Glissando #'minimum-length = #2.5
  \override Score.Glissando #'thickness = #1.5
}

notesetterStems = {
  \override Score.Stem #'details = #'(
  (lengths 3.5 3.5 3.5 4.5 5.0 6.0)
  (beamed-lengths 3.26 3.5 3.6)
  (beamed-minimum-free-lengths 3.0 2.0 1.75)
  (beamed-extreme-minimum-free-lengths 2.5 1.75)
  (stem-shorten 0.0 0.0)
  )
}

notesetterBeams = {
  \override Score.Beam #'beamed-stem-shorten = #'(0.0 0.0 0.0)
}

%% Center chord symbols on the vertical note axis

#(define (centerCN grob)  (ly:stencil-aligned-to (ly:text-interface::print grob) X CENTER ))

centerChords = {
  \override ChordNames.ChordName #'stencil = #centerCN
  \override ChordNames.ChordName #'extra-offset = #'(0.75 . 0.0)
}