%%New Tricks%%

DYNEXO = #(define-music-function (parser location beg-end) (pair?)
           #{ \once \override DynamicText.extra-offset = #beg-end #})

%% Moves dynamic text along x . y axes according to input

{ \DYNEXO #'(1.5 . 0.0) c4\ffff }