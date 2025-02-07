from math import exp
import numpy as np

def rbf_network_cython(double[:, :] X, double[:] beta, double theta):
    cdef int N = X.shape[0]
    cdef int D = X.shape[1]
    cdef int Y = np.zeros(N)
    cdef int i, j, d 
    cdef double r = 0

    for i in range(N):
        for j in range(N):
            r = 0
            for d in range(D):
                r += (X[j, d] - X[i, d]) ** 2
            r = r**0.5
            Y[i] += beta[j] * exp(-(r * theta)**2)

    return Y