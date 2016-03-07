//
//                      CLAVICOM
//
//    A music sequencer for the AMSTRAD CPC computer.
//
//    Programmer:             Richard Brooksby
//    Source language:        BCPL
//    Last updated:           21JAN88
//

// Copyright (C) 1988, 1999 Richard Brooksby.  All rights reserved.  You
// may make and distribute verbatim copies of this document provided that
// you retain as they appear all copyright and licence notices.  You may
// NOT charge a fee for this document or for distributing this document. 
// You may NOT make or distribute derivative works (modified versions) of
// this document without the express written permission of the copyright
// holder.
//
// This copyright notice was added on 1999-09-20.

//    Note array data:
//    top byte value    low byte value
//    0 to 2            octave,note
//    3 to 5            noise period
//    6 to 8            vol env, tone env
//    9 to 11           one off vol env, one off tone env
//    12                percent change in beat_length
//    13+length-1 <20   time bar of "length" bars
//    -nnn              go to position in music

//                              COMPILER OPTIONS

// Escape key checking off. The program is exited by using [CTRL-X]
option b-


//                        STANDARD FUNCTION LIBRARIES
//              (These provide the basic I/O for the language.)

get "cvdu.lib"
get "fileio.lib"



/////////////////////////////// GLOBAL CONSTANTS ///////////////////////////////


manifest
$(
      void = 32767            // ...meaning "no particular value"
      array = #x6000          // ...meaning "will later point to an array"
      maxint = 32767          // Maximum positive integer value

      scrwidth = 25           // The number of notes across the screen
      music_size = 3000       // The size of the music event arrays
      nr_notes = 13           // The number of notes in a scale
      nr_envelopes = 15       // The number of envelopes available

      max_beat_len = 3000     // These are the upper and lower limits of the
      min_beat_len = 1        // length, which controls speed of the music.

      music_wndw = 1          // } These are the stream numbers for the windows
      status_wndw = 2         // } on the screen. In this program stream 0 is
      prompt_wndw = 3         // } left covering the whole screen.
      command_wndw = 4        // }
      lh_cmnd_wndw = 5        // } These two are halves of
      rh_cmnd_wndw = 6        // } the command window.
$)



/////////////////////////////// GLOBAL VARIABLES ///////////////////////////////


static
$(
      // MUSIC DATA

      event_time = array      // Array of the times of events.
      event = array           // The corresponding events themselves.
      free_space = 0          // The first free event in the above arrays.
      envelopes = array       // The envelope shapes.
      bar_length = 4          // The length of a bar in terms of beats.
      beat_length = 60        // The length of a beat in 300th of second.

      // EDITING

      cur_time = 0            // The time of the editing cursor.
      cur_channel = 0         // The channel of the cursor.
      left_edge = 0           // The time at the left edge of the screen.
      note_name = array       // Array of note name strings. (C,C#,D...)
      key = void              // General use, the last key pressed.
      placing = void          // see find_event()
      bl_start = 0            // }
      bl_end = 0              // } The extent of the editing block.
      bl_channel = 0          // }
      block_ev = -1           // Used to trace the block; see find_first()
      sharps = true           // True when the notation is sharps not flats.
$)

get "clavi1.sub"

get "clavi2.sub"

///////////////////////// END OF CLAVICOM SOURCE CODE /////////////////////////
