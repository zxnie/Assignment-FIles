import wave

CHANNELS = 1
swidth = 2
Change_RATE = 2

spf = wave.open('00-1.wav', 'rb')
RATE=spf.getframerate()
signal = spf.readframes(-1)

wf = wave.open('00-changed.wav', 'wb')
wf.setnchannels(CHANNELS)
wf.setsampwidth(swidth)
wf.setframerate(RATE*1.2)
wf.writeframes(signal)
wf.close()