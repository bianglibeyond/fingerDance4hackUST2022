# import time and rtmidi package
import time
import rtmidi

# the function call rtmidi.Midiout() creates the handler that we'll use to send midi signals
midiout = rtmidi.MidiOut()

# check and get the ports which are open
available_ports = midiout.get_ports()

# here we're printing the ports to check that we see the one that loopMidi created.
# In the list we should see a port called "loopMIDI port".
print(available_ports)

# Attempt to open the port
if available_ports:
    midiout.open_port(port='MIDIOUT4 (MIDI USB-USB) 4', type_='output')
else:
    midiout.open_virtual_port("My virtual output")

# this is how you create a midi note, the specs are: [command, note, velocity]
note_on = [0x90, 60, 112]
note_off = [0x80, 60, 0]
midiout.send_message([0x90, 60, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 60, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 67, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 67, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 69, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 69, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

midiout.send_message([0x90, 67, 70])

# Here you need to insert a short delay before turning the note off to make sure that the note_on signal was received
time.sleep(0.5)
midiout.send_message(note_off)

del midiout