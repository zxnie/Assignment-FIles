import sys
# import trace file
contents = []
f= open(sys.argv[1],"r")
content = f.read()
content = content.split('\n')
for row in content:
    contents.append(row.split(' '))

snr = []
for row in contents:
    if row[0] == 's' or row[0] == 'r':
        snr.append(row)
print ('Trace file read complete.')

# outputs
seqno = 0
sent = 0
received = 0
delay = 0
avg_delay = 0
count = 1
rcp = 0

# Total packets
for row in contents:
    if len(row) < 8:
        continue    
    elif row[0] == 's' and row[3] == 'AGT' and seqno < int(row[6]):
        seqno = int(row[6])

print ('Got total packets.')

# Delivery ratio
for row in snr:
    if row[0] == 's' and row[3] == 'AGT':
        sent += 1
    elif row[0] == 'r' and row[3] == 'AGT':
        received += 1
    elif row[0] == 's' and row[7] == 'DSR':
        rcp += 1

print ('Got delivery ratio.')

# Get valid seqno
seqnolist = []
for row in snr:
    seqnolist.append(int(row[6]))

seqnolist = set(seqnolist)
seqnolist = list(seqnolist)
seqnolist.sort
# print (seqnolist)

# End-to-end delay
start_time = [0] * len(seqnolist)
end_time = [0] * len(seqnolist)
i = 0
for i in range(len(seqnolist)):
    for row in snr:
        if row[0] == 's' and row[3] == 'AGT' and row[6] == str(seqnolist[i]):
            start_time[i] = float(row[1])
        elif row[0] == 'r' and row[3] == 'AGT' and row[6] == str(seqnolist[i]):
            end_time[i] = float(row[1])
print ('Got start time and end time')

j = 0
for j in range(len(seqnolist)):
    if end_time[j] != 0:
        delay += (end_time[j] - start_time[j])
        count += 1

avg_delay = delay / count
print ('Got average delay')

# Show results
print ('=========================================')
print ('Packets generated:', seqno)
print ('Sessions sent:', sent)
print ('Sessions received:', received)
print ('Packet delivery ratio:', received/sent)
print ('Average delay:', avg_delay)
print ('Routing control packets:', rcp)
