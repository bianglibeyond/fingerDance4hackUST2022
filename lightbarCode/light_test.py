from __future__ import print_function

import logging
import sys
import time

from rtmidi.midiutil import open_midioutput
from rtmidi.midiconstants import NOTE_OFF, NOTE_ON


log = logging.getLogger('midiout')
logging.basicConfig(level=logging.DEBUG)

# Prompts user for MIDI input port, unless a valid port number or name
# is given as the first argument on the command line.
# API backend defaults to ALSA on Linux.
port = 4#sys.argv[1] if len(sys.argv) > 1 else None

try:
    midiout, port_name = open_midioutput(port)
except (EOFError, KeyboardInterrupt):
    sys.exit()

note_on = [NOTE_ON, 60, 112]  # channel 1, middle C, velocity 112
note_off = [NOTE_OFF, 60, 0]

with midiout:
    midiout.send_message([0x90, 60, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 60, 70])


    midiout.send_message([0x90, 60, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 60, 70])


    midiout.send_message([0x90, 67, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 67, 70])


    midiout.send_message([0x90, 67, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 67, 70])


    midiout.send_message([0x90, 69, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 69, 70])


    midiout.send_message([0x90, 69, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 69, 70])


    midiout.send_message([0x90, 67, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 67, 70])

    time.sleep(0.5)

    midiout.send_message([0x90, 65, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 65, 70])


    midiout.send_message([0x90, 65, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 65, 70])

    midiout.send_message([0x90, 64, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 64, 70])
    

    midiout.send_message([0x90, 64, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 64, 70])


    midiout.send_message([0x90, 62, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 62, 70])
    

    midiout.send_message([0x90, 62, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 62, 70])


    midiout.send_message([0x90, 60, 70])

    # Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
    time.sleep(0.5)
    midiout.send_message([0x80, 60, 70])

    

del midiout
print("Exit.")