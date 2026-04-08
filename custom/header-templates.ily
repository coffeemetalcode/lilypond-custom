%%% header-templates.ily
%%% Predefined \header blocks and helper variables for personal, public,
%%% and commercial LilyPond projects.
%%%
%%% Usage: include this file at the top of your .ly file and then set the
%%% relevant variables before calling \personalHeader, \publicHeader, or
%%% \commercialHeader:
%%%
%%%   \include "path/to/custom/header-templates.ily"
%%%
%%%   titleText    = "My Piece"
%%%   composerText = "Jane Doe"
%%%   \personalHeader
%%%

%% ──────────────────────────────────────────────────────────────────────────
%% User-defined variables (override these in your score file)
%% ──────────────────────────────────────────────────────────────────────────

titleText       = "Untitled"
subtitleText    = ""
composerText    = ""
lyricistText    = ""
arrangerText    = ""
dedicationText  = ""
opusText        = ""
instrumentText  = ""
copyrightYear   = "2024"
publisherText   = ""
copyrightOwner  = ""
licenseText     = ""
taglineText     = ##f   %% set to ##f to suppress the default LilyPond tagline

%% ──────────────────────────────────────────────────────────────────────────
%% Personal use header (minimal, no copyright block)
%% ──────────────────────────────────────────────────────────────────────────

personalHeader = \header {
  title       = \titleText
  subtitle    = \subtitleText
  composer    = \composerText
  lyricist    = \lyricistText
  arranger    = \arrangerText
  dedication  = \dedicationText
  opus        = \opusText
  instrument  = \instrumentText
  tagline     = \taglineText
}

%% ──────────────────────────────────────────────────────────────────────────
%% Public / open-source header (Creative Commons or similar free licence)
%% ──────────────────────────────────────────────────────────────────────────

publicHeader = \header {
  title       = \titleText
  subtitle    = \subtitleText
  composer    = \composerText
  lyricist    = \lyricistText
  arranger    = \arrangerText
  dedication  = \dedicationText
  opus        = \opusText
  instrument  = \instrumentText
  copyright   = \markup {
    \center-column {
      \line {
        © \copyrightYear \composerText
        — Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0)
      }
      \line {
        \italic { https://creativecommons.org/licenses/by/4.0/ }
      }
    }
  }
  tagline     = \taglineText
}

%% ──────────────────────────────────────────────────────────────────────────
%% Commercial header (all-rights-reserved copyright block)
%% ──────────────────────────────────────────────────────────────────────────

commercialHeader = \header {
  title       = \titleText
  subtitle    = \subtitleText
  composer    = \composerText
  lyricist    = \lyricistText
  arranger    = \arrangerText
  dedication  = \dedicationText
  opus        = \opusText
  instrument  = \instrumentText
  copyright   = \markup {
    \center-column {
      \line {
        © \copyrightYear \copyrightOwner — All Rights Reserved
      }
      \line {
        \italic { Unauthorised copying, arranging, adapting, or recording is an infringement of applicable laws. }
      }
      \line {
        \publisherText
      }
    }
  }
  tagline     = \taglineText
}
