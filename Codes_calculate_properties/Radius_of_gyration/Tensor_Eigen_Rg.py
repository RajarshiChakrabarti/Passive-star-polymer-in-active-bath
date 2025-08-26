import math
import numpy as np
from numpy import linalg as LA 
gyr_ten=np.genfromtxt("Rg_0_10.dat", usecols=(0, 1)) 
gyr_ten=np.reshape(gyr_ten, (1500001, 2, 2))
for i in range(1500001):
    a, b = LA.eig(gyr_ten[i, :, :]) # a- array of eigen values and  b- array of eigen vetors (from origin) 
    with open('RG_Test_EigenV_0_10.dat', 'a') as fp1:
    	print("%8.5f" % math.sqrt(sum(a)), file=fp1) # Radius of Gyration
    with open('RG_EigenValues_10.dat', 'a') as fp2: 
    	print(a, file=fp2) # Eigen Values

