%% hl-chord-utils.ily

%% Helper Commands
alterSharp = \markup { \fontsize #-2.5 \translate-scaled #'(0 . 1.0) \sharp }
alterFlat = \markup { \fontsize #-2.5 \translate-scaled #'(0 . 0.5) \flat }
hlSerifFont =  \override ChordName.font-name = "Times LT Std, Times New Roman, DejaVu Serif, serif"
hlSansFont = \override ChordName.font-name = "Helvetica LT Std, Arial, DejaVu Sans, sans-serif"

%% Stacked suffix markup command
%% Usage: \markup { \stacked-suffix "top" "bottom" } (center, default)
%%    or: \markup { \stacked-suffix-left "top" "bottom" }
%%    or: \markup { \stacked-suffix-right "top" "bottom" }

%% Internal helper that takes alignment as first arg
#(define (stacked-suffix-internal layout props align top bottom)
  "Stack two markup elements vertically with scaled spacing.
   @var{layout} - the layout object
   @var{props} - property alist (used to get font-size for scaling)
   @var{align} - symbol: 'left, 'right, or 'center
   @var{top} - markup for top element
   @var{bottom} - markup for bottom element
   Returns a markup with elements stacked and positioned relative to chord root."
  (let* ((size-factor (magstep (chain-assoc-get 'font-size props 0)))
         (base-skip 1.25)
         (base-raise 1.05)
         (scaled-skip (* base-skip size-factor))
         (column-cmd (case align
                      ((left) make-left-column-markup)
                      ((right) make-right-column-markup)
                      (else make-center-column-markup))))
   (interpret-markup layout props
    (markup
     #:translate-scaled (cons 0 base-raise)
     #:fontsize -4.25
     #:override `(baseline-skip . ,scaled-skip)
     (column-cmd (list top bottom))))))

#(define-markup-command (stacked-suffix layout props top bottom)
  (markup? markup?)
  "Stack two suffix elements vertically, center-aligned."
  (stacked-suffix-internal layout props 'center top bottom))

#(define-markup-command (stacked-suffix-left layout props top bottom)
  (markup? markup?)
  "Stack two suffix elements vertically, left-aligned."
  (stacked-suffix-internal layout props 'left top bottom))

#(define-markup-command (stacked-suffix-right layout props top bottom)
  (markup? markup?)
  "Stack two suffix elements vertically, right-aligned."
  (stacked-suffix-internal layout props 'right top bottom))
