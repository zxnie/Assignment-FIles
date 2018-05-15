import sys
# import trace file
contents = []
f= open(sys.argv[1],"r")
content = f.read()
content = content.split('\n')
for row in content:
    contents.append(row.split(' '))
# print (contents)
print ('File load complete.')

matrix = []
line = ''
for row in contents:
    if len(row) == 8:
        line = row[5] + ',' + row[6] + ',' + row[7]
        matrix.append(line)
    else:
        continue
for element in matrix:
    print (element)