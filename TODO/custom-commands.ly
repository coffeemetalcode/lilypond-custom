%%%%%%%%%% CODA SETTINGS %%%%%%%%%%

%%%%% D.S. al Coda %%%%%

%%% includes the words "To Coda" before the Coda sign and centers the coda sign horizontally on the barline

textToCoda = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #0.770
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \small
    \bold
    \italic "To Coda  "
    \musicglyph #"scripts.coda"
  }
}

%%% text "D.S. al Coda" right-aligned

dalSegno = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \mark 
  \markup {
    \small
    \bold
    \italic "D.S. al Coda"
  }
}

%%% includes the word "Coda" after the coda sign

textCoda = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #-0.3
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \musicglyph #"scripts.coda"
    \small
    \bold "Coda"
  }
}

%%%%% D.S. al Coda 1 %%%%%

%%% includes the words "To Coda 1" before the Coda sign and centers the coda sign horizontally on the barline

textToCodaI = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #0.770
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \small
    \bold
    \italic "To Coda 1  "
    \musicglyph #"scripts.coda"
  }
}

%%% text "D.S. al Coda 1" right-aligned

dalSegnoI = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \mark 
  \markup {
    \small
    \bold
    \italic "D.S. al Coda 1"
  }
}

%%% includes the word "Coda 1" after the coda sign

textCodaI = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #-0.15
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \musicglyph #"scripts.coda"
    \small
    \bold "Coda 1"
  }
}

%%%%% D.S. al Coda 2 %%%%%

%%% includes the words "To Coda 2" before the Coda sign and centers the coda sign horizontally on the barline

textToCodaII = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #0.770
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \small
    \bold
    \italic "To Coda 2  "
    \musicglyph #"scripts.coda"
  }
}

%%% text "D.S. al Coda 2" right-aligned

dalSegnoII = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \mark 
  \markup {
    \small
    \bold
    \italic "D.S. al Coda 2"
  }
}

%%% includes the word "Coda 2" after the coda sign

textCodaII = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #-0.15
  \mark
  \markup
  \line
  \general-align #Y #CENTER {
    \musicglyph #"scripts.coda"
    \small
    \bold "Coda 2"
  }
}

%%%%% D.S.S. al Coda 2 %%%%%

%%% text "D.S.S. al Coda 2" right-aligned

dalSegnoSegnoII = {
  \once
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \mark 
  \markup {
    \small
    \bold
    \italic "D.S.S. al Coda 2"
  }
}

%%% Segno sign

segnoSign = {
  \mark
  \markup {
    \musicglyph #"scripts.segno"
  }
}

%%% Double Segno sign

segnoSegnoSign = {
  \mark
  \markup {
    \musicglyph #"scripts.segno"
    \musicglyph #"scripts.segno"
  }
}

%%%%%%%%%% GUITAR FINGERING SETTINGS %%%%%%%%%%

%%% Abbreviate Right Hand Fingering Command

shortRightHand = {
  #(define rH rightHandFinger)
}

%%% Guitar Fingering Placement

guitarFinUpper = {
  \set fingeringOrientations = #'(left)
  \override Fingering #'font-size = #-6
  \set stringNumberOrientations = #'(up)
  \override StringNumber #'add-stem-support = ##t
  \set strokeFingerOrientations = #'(up)
  \override StrokeFinger #'font-size = #-1
  \override StrokeFinger #'add-stem-support = ##t
}

guitarFinLower = {
  \set fingeringOrientations = #'(left)
  \override Fingering #'font-size = #-6
  \set stringNumberOrientations = #'(down)
  \override StringNumber #'add-stem-support = ##t
  \set strokeFingerOrientations = #'(down)
  \override StrokeFinger #'font-size = #-1
  \override StrokeFinger #'add-stem-support = ##t
}

%%% Harmonic Noteheads

harmOn = {
  \override Voice.NoteHead  #'style = #'harmonic-mixed
  \tieDashed
}

harmOff = { 
  \revert Voice.NoteHead  #'style
  \tieSolid  
}

%%% barre spanners

%% %%%%%%%  Cut here ----- Start 'bbarred.ly' 

%% PostScript -------------------------------
pScript= \markup { 
	\with-dimensions #'(0 . 0.8) #'(0 . 2.0) 
	\postscript	#"
	0.15 setlinewidth 
	/Times-Roman findfont
	2.0 scalefont
	setfont
	(C)show %%change with B if you prefer
       %(B)show %%change with C if you prefer
	stroke
	0.7 -0.5 moveto
	0.7  1.7 lineto
	stroke"
}
%% Span -----------------------------------
%% Syntax: \bbarre #"text" { notes } - text = any number of box 
bbarre= #(define-music-function (barre location str music) (string? ly:music?)
           (let ((spanned-music 
                   (let ((first-element #f)
                         (last-element #f)
                         (first-found? #f))
                     (music-map (lambda (m)
                                  (if (eqv? (ly:music-property m 'name) 'EventChord)
                                      (begin
                                        (if (not first-found?) 
                                            (begin
                                              (set! first-found? #t)
                                              (set! first-element m)))
                                        (set! last-element m)))
                                  m)
                                music)
                     (if first-found?
                         (begin
                           (set! (ly:music-property first-element 'elements)
                                 (cons (make-music 'TextSpanEvent 'span-direction -1)
                                       (ly:music-property first-element 'elements)))
                           (set! (ly:music-property last-element 'elements)
                                 (cons (make-music 'TextSpanEvent 'span-direction 1)
                                       (ly:music-property last-element 'elements)))))
                     music)))
             (make-music 'SequentialMusic
               'origin location
               'elements (list #{
			\once \override TextSpanner #'font-size = #-2
			\once \override TextSpanner #'font-shape = #'upright
			\once \override TextSpanner #'staff-padding = #3
			\once \override TextSpanner #'style = #'line 
                        \once \override TextSpanner #'to-barline = ##f 	
                        \once \override TextSpanner #'bound-details =  #'((left (Y . 0) (padding . 0.25) (attach-dir . -2)) (right (Y . 0) (padding . 0.25) (attach-dir . 2))) 
                        \once  \override TextSpanner #'bound-details #'right #'text = \markup { \draw-line #'( 0 . -.5) }
                        \once  \override TextSpanner #'bound-details #'left #'text =  \markup { \pScript $str } 
%% uncomment this line for make full barred
                       % \once  \override TextSpanner #'bound-details #'left #'text =  \markup { "B" $str }                         
                          #}
    spanned-music))))

%% %%%%%%%  Cut here ----- End 'bbarred.ly' 
%% Copy and change the last line for full barred. Rename in 'fbarred.ly'                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%  Cut here ----- Start 'bbarred.ly' 

%% PostScript -------------------------------
pScript= \markup { 
	\with-dimensions #'(0 . 0.8) #'(0 . 2.0) 
	\postscript	#"
	0.15 setlinewidth 
	/Times-Roman findfont
	2.0 scalefont
	setfont
	(C)show %%change with B if you prefer
       %(B)show %%change with C if you prefer
	stroke
	0.7 -0.5 moveto
	0.7  1.7 lineto
	stroke"
}
%% Span -----------------------------------
%% Syntax: \bbarre #"text" { notes } - text = any number of box 
fbarre= #(define-music-function (barre location str music) (string? ly:music?)
           (let ((spanned-music 
                   (let ((first-element #f)
                         (last-element #f)
                         (first-found? #f))
                     (music-map (lambda (m)
                                  (if (eqv? (ly:music-property m 'name) 'EventChord)
                                      (begin
                                        (if (not first-found?) 
                                            (begin
                                              (set! first-found? #t)
                                              (set! first-element m)))
                                        (set! last-element m)))
                                  m)
                                music)
                     (if first-found?
                         (begin
                           (set! (ly:music-property first-element 'elements)
                                 (cons (make-music 'TextSpanEvent 'span-direction -1)
                                       (ly:music-property first-element 'elements)))
                           (set! (ly:music-property last-element 'elements)
                                 (cons (make-music 'TextSpanEvent 'span-direction 1)
                                       (ly:music-property last-element 'elements)))))
                     music)))
             (make-music 'SequentialMusic
               'origin location
               'elements (list #{
			\once \override TextSpanner #'font-size = #-2
			\once \override TextSpanner #'font-shape = #'upright
			\once \override TextSpanner #'staff-padding = #3
			\once \override TextSpanner #'style = #'line 
                        \once \override TextSpanner #'to-barline = ##f 	
                        \once \override TextSpanner #'bound-details =  #'((left (Y . 0) (padding . 0.25) (attach-dir . -2)) (right (Y . 0) (padding . 0.25) (attach-dir . 2))) 
                        \once  \override TextSpanner #'bound-details #'right #'text = \markup { \draw-line #'( 0 . -.5) }
                        \once  \override TextSpanner #'bound-details #'left #'text =  \markup { \pScript $str } 
%% uncomment this line for make full barred
                         \once  \override TextSpanner #'bound-details #'left #'text =  \markup { "C" $str }                         
                          #}
    spanned-music))))

%% %%%%%%%  Cut here ----- End 'bbarred.ly' 
%% Copy and change the last line for full barred. Rename in 'fbarred.ly'                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
