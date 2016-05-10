# SIA-TPE2


### Installation ###

Clone the repository, make sure you have octave installed
 ```bash
   > git clone https://github.com/NicoBuch/SIA-TPE2.git
   > sudo apt-get install octave


## Running ##

  Open init.m file and change the following values:
    - layerSizes : Sizes of the layers you want to try. Eg: [1 512 256 128 64 32 16 8]
      eta : The value of the eta you want to try. Eg: 0.001
      gValue : Activation function. 1 for tanh and 2 for exp.
      betaValue : beta value, to be used in, for example, tanh(beta * x) . Eg: 0.75
      error : Lower bound for the error. The perceptron will run until half cuadratic error is lower than this value. Eg: 1
      momentum : Value of alpha in the momentum algorithm. Eg: 0.5
      etaAdaptativo : Value of k in the Adaptative Eta algorithm. It measures how consistent the delta error has to be. Eg: 5
      a : Value of "a" in Eta Adaptative. It is how much it adds when error is descending consistently. Eg: 0.0005
      b : Value of "b" in Eta Adaptative. It is how much percentage of eta substracts when error is ascending. Eg: 0.1

Compile and run with a specific board, strategy and heuristic
 ```bash
   > cd < path to /SIA-TPE2 >
   > octave init.m


## Maintainer ##

This project is maintained by [Nicolás Buchhalter, Agustina Fainguersch and Francisco Depascuali](https://github.com/NicoBuch).
