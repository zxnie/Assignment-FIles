import wave
import sys
infiles = []
for i in range(len(sys.argv) - 2):
    infiles.append(sys.argv[i+1])
outfile = sys.argv[-1]
print (infiles)
print (outfile)

data= []
for infile in infiles:
    w = wave.open(infile, 'rb')
    data.append( [w.getparams(), w.readframes(w.getnframes())] )
    w.close()

output = wave.open(outfile, 'wb')
output.setparams(data[0][0])
for i in range(len(sys.argv) - 2):
    output.writeframes(data[i][1])
output.close()