\version "2.18.2"

%% 6/29/2015
%% This document will morph into a style sheet to use
%% with Guitar/Tab/Vocal sheets in the style of Hal Leonard
%% GRV books, Alfred Guitar/Tab songbooks, and the like

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% A set of custom line spanners for guitar/TAB %%%
%%% transcriptions in Hal Leonard GRV style %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

customTextLine = {
  \override Score.TextSpanner.thickness = #1.25
  \override Score.TextSpanner.dash-period = #1.25
  \override Score.TextSpanner.dash-fraction = #0.4
  \override TextSpanner.bound-details.left.padding = #-0.75
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #0.15
}
  

terminus = \markup {
  \draw-line #'(0 . 0.625)
  \hspace #-0.72 %% This value is good for global staff size 17.82 - other sizes may require minor tweaks
  \draw-line #'(0 . -0.625)
}

pmBreak = {
  \textSpannerDown
  \customTextLine  
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "P.M. " }
  \override TextSpanner.bound-details.right.padding = #-1.5
}

pm = {
  \textSpannerDown
  \customTextLine  
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "P.M. " }
  \override TextSpanner.bound-details.right.padding = #-1.5
  \override TextSpanner.bound-details.right.text = \terminus
}

letRingBreak = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny "let ring " }
  \override TextSpanner.bound-details.right.padding = #-1.5
}

letRing = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny "let ring " }
  \override TextSpanner.bound-details.right.padding = #-1.5
  \override TextSpanner.bound-details.right.text = \terminus
}

harmBreak = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "Harm. " }
  \override TextSpanner.bound-details.right.padding = #-1.5
}

harm = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "Harm. " }
  \override TextSpanner.bound-details.right.padding = #-1.5
  \override TextSpanner.bound-details.right.text = \terminus
}

vibBarBreak = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "w/bar " }
  \override TextSpanner.bound-details.right.padding = #-1.5
}

vibBar = {
  \textSpannerDown
  \customTextLine
  \override TextSpanner.bound-details.left.text = \markup { \tiny \upright "w/bar " }
  \override TextSpanner.bound-details.right.padding = #-1.5
  \override TextSpanner.bound-details.right.text = \terminus
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Commands and tweaks for Vocal Music  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cueSize =
#(define-music-function (parser location music) (ly:music?)
   (map-some-music
     (lambda (m)
       (and (music-is-of-type? m 'note-event)
            #{ \tweak font-size #-3 $m #}))
     music))

cueSizeGrace = %%This does *NOT* work?
#(define-music-function (parser location music) (ly:music?)
   (map-some-music
     (lambda (m)
       (and (music-is-of-type? m 'grace-music)
            #{ \tweak font-size #-6 $m #}))
     music))

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Sample Music Section %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{  <----- turn this off and on by unquoting the first quote bracket

%% GRV Line Spanners

\new Staff \relative c, {
  \clef "treble_8"
  \pm
  e4\startTextSpan b' e b \stopTextSpan
  \letRing
  e,\startTextSpan b' e b \stopTextSpan
}

%% Lead voice with background voices

leadVoice = \relative c'' { c4( d e2 ) }
bkgdVoiceI = \relative c'' { g4( b c2 ) }
bkgdVoiceII = \relative c'' { e4( f g2 ) }

\new Voice
<<
  \cueSize \bkgdVoiceII
  \leadVoice
  \cueSize \bkgdVoiceI
>>

%}