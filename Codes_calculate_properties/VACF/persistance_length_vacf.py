import numpy as np
from scipy.integrate import simpson

def calculate_persistence_length(time, vacf, v0=None):
    """
    Calculate persistence length from velocity autocorrelation function.
    
    Parameters:
    - time: 1D numpy array of time points
    - vacf: 1D numpy array of velocity autocorrelation values at corresponding times
    - v0: scalar, initial speed of the particle. If None, estimated as sqrt(vacf[0])
    
    Returns:
    - persistence_length: float, persistence length = v0 * integral of normalized VACF
    - persistence_time: float, integral of normalized VACF (velocity correlation time)
    """
    vacf0 = vacf[0]
    vacf_normalized = vacf / vacf0
    
    persistence_time = simpson(vacf_normalized, time)
    
    if v0 is None:
        v0 = np.sqrt(vacf0)
    
    persistence_length = v0 * persistence_time
    
    return persistence_length, persistence_time

if __name__ == "__main__":
    # Load data from file
    data = np.loadtxt("VACF_f0_star_1.dat")
    
    time = data[:, 0]
    vacf = data[:, 1]
    
    # Calculate persistence length and time
    ell_p, tau_p = calculate_persistence_length(time, vacf, v0=None)
    
    print(f"Calculated persistence time: {tau_p:.5f}")
    print(f"Calculated persistence length: {ell_p:.5f}")
