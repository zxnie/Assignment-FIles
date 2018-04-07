import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation
from keras.optimizers import SGD
import numpy as np
import random
import h5py
# Import data
import csv
datas = []
labels = []

with open ('train.csv') as f:
	reader = csv.reader(f)
	for row in reader:
		datas.append(row[1])
		labels.append(row[2])
del datas[0]
del labels[0]

# Convert letters to integers
label = np.zeros((2000,1))
data = np.zeros((2000,14))
label = np.reshape(labels, (2000,1))

def switch(letter=''):
	if letter=='A':
		return int(10)
	elif letter=='C':
		return int(20)
	elif letter=='G':
		return int(30)
	else :
		return int(40)

for i in range(2000):
	for j in range(14):
		data[i][j] = switch(datas[i][j])

# Initialize Network
model = Sequential()
# Dense(64) is a fully-connected layer with 64 hidden units.
# in the first layer, you must specify the expected input data shape:
# here, 20-dimensional vectors.
model.add(Dense(256, activation='relu', input_dim=14))
model.add(Dropout(0.5))
model.add(Dense(128, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(64,activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(2, activation='softmax'))

rmsprop = keras.optimizers.RMSprop(lr=0.001, rho=0.9, epsilon=None, decay=0.0)
adamx = keras.optimizers.Adamax(lr=0.001, beta_1=0.9, beta_2=0.999, epsilon=None, decay=0.0)
model.compile(loss='sparse_categorical_crossentropy',
              optimizer=adamx,
              metrics=['accuracy'])

model.fit(data, label,
          epochs=3000,
          batch_size=400)
score ,acc = model.evaluate(data, label, batch_size=400)
print('Test score:', score)
print('Test accuracy:', acc)
model.save("./model.h5")
