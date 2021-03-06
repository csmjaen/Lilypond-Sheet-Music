\version "2.14.2"
\include "deutsch.ly"

#(set-global-staff-size 18)

\header {
  title     = \markup \bold \italic "Drei Menuette"
  composer  = "Georg Philipp Telemann (1681-1767)"
  arranger  = "arr.: Peter Baljeu"
  enteredby = "cellist (2014-04-25)"
}

voiceconsts = {
  \time 3/4
  \clef "bass"
  % \numericTimeSignature
  % Set default beaming for all staves
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1 4)
  \set Timing.beatStructure = #'(1 1 1)
  \compressFullBarRests
}

mihi = "clarinet"
milo = "bassoon"
%mihi = "church organ"
%milo = "church organ"

introa = {        \key f \major \tempo "I."   4=112 }
introb = { \break \key g \major \tempo "II."  4=100 }
introc = { \break \key f \major \tempo "III." 4=100 }

\include "v1.ily"
\include "v2.ily"
\include "v3.ily"
\include "v4.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello I" }
	\transpose c c, { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello II" }
	\transpose c c, { \vb }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello III" }
	\transpose c c, { \vc }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello IV" }
	\transpose c c, { \vd }
      }
>>

\book {
  \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}
