import numpy as np
import matplotlib.pyplot as plt

# sigmoid function
def nonlin(x,deriv=False):
    if(deriv == True):
        return x*(1-x)
    return 1/(1+np.exp(-x))

''' Plot sigmoid function
x = np.arange(-100., 100., 0.2)
sig = nonlin(x)
plt.plot(x,sig)
'''

# input dataset
X = np.array([  [0,0,1],
                  [0,1,1],
                  [1,0,1],
                  [1,1,1]  ])
# output dataset
y = np.array([[0,0,1,1]]).T

# seed random numbers to make calculation
# deterministic
np.random.seed(1)
''' PLot random numbers
x = np.arange(0, 6000, 1)  
ar = []
for i in range(6000):
    ar.append(np.random.randint(1,10))  #interesting diff b/w randint and uniform
plt.scatter(ar,x)
'''

# initialize weights randomly with mean 0
syn0 = 2 * np.random.random((3,1)) - 1   

for iter in xrange(1000):
    # forward propagation
    l0 = X # first layer (input layer)
    l1 = nonlin(np.dot(l0,syn0)) # second layer (hidden layer)
    if iter == 1: 
        print l1
    # error
    l1_error = y - l1
    
    # multiply the residual error by the slope 
    # of the sigmoid at the values in l1
    l1_delta = l1_error * nonlin(l1,True)
    
    # update weights
    syn0 += np.dot(l0.T, l1_delta)

print "Output After Testing:"
print l1
    
    
    
 
    