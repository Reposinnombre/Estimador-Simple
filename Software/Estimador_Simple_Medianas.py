import numpy as np

def est_medianas(potencia):
    N = len(potencia)

    valor_medio = np.mean(potencia)

    pot_ordenado = np.sort(potencia)

    j = 0
    k = 0

    potencia_gauss        = []
    potencia_no_gauss     = []

    for i in range(N):
        if (pot_ordenado[i] <= valor_medio):
            potencia_gauss = np.append(potencia_gauss,pot_ordenado[i])
            j = j + 1
        else:
            potencia_no_gauss = np.append(potencia_no_gauss,pot_ordenado[i])
            k = k + 1
    
    Sigmag2_med = np.mean(potencia_gauss)
    A_med = k/512

    Mg = np.median(potencia_gauss)
    Mi = np.median(potencia_no_gauss)
    r_med = 1/(A_med*(Mi/Mg - 1))

    return A_med,Sigmag2_med,r_med
