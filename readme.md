This project contains the code for the numerical experiments in the paper "Quantum Signal Processing and Quantum Singular Value Transformation on $U(N)$"(arxiv: todo).
The structure of the project is as follows:
- `oqae_std.nb`: Mathematica code for the asyptotic bound under the standard deviation error;
- `oqae_window.nb`: Mathematica code for the asyptotic bound under the window error, with dependencies:
    - `brent.wl`: Brent Method Implementation in Mathematica (https://www.theradixpoint.com/brent/brent2.html);
    - `chebpe.ipynb`: An implementation and benchmark of the ChebAE algorithm from arXiv:2207.08628 (https://github.com/qiskit-community/ChebAE), in which we modify the number of queries in section *Main Algorithm* Line 44 to fit our definition;
    - `chebpe.txt`: The output of `chebpe.ipynb` for `oqae_window.nb` to read;
