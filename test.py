from qiskit import *

qc = QuantumCircuit(2, 2)

qc.h(0)
qc.cx(0, 1)
