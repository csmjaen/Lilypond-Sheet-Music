\version "2.14.2"
\include "deutsch.ly"

#(set-global-staff-size 17.5)

\header {
  title = "Sonata I"
  subtitle = "aus: \"VI Sonates Violoncello Solo col Basso\""
  subsubtitle = "RV 47, 1740"
  composer = "Antonio Vivaldi"
  arranger = "(1678-1741)"
  enteredby = "cellist (2010-08-04)"
}

voiceconsts = {
 \key b \major
  \clef "bass"
% \numericTimeSignature
 \compressFullBarRests
}

mihi = "clarinet"
%minstr = "accordion"
milo = "bassoon"
mibc = "harpsichord"

moral = \markup \italic "molto rall."

introa = { \tempo "1. Largo " 4=50  \time 4/4 }
introb = { \break \tempo "2. Allegro " 8=160  \time 3/8 }
introc = { \break \tempo "3. Largo " 4=60  \time 3/4 }
introd = { \break \tempo "4. Allegro " 4=110  \time 2/4 }

\include "v1.ily"
\include "v2.ily"


music = \new StaffGroup <<
          \new Staff {
	    \set Staff.midiInstrument = \milo
            \set Staff.instrumentName = #"Cello"
            \va
          }

          \new Staff {
	    \set Staff.midiInstrument = \mibc
            \set Staff.instrumentName = #"B.C."
            \vb
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
